---
domain: IT_Knowledge
type: troubleshooting-postmortem
status: resolved
tags: [tomcat, java, windows, permissions, devops]
created: 2026-06-15
time-wasted: 2h
---

# Post-Mortem: Tomcat 9 "Disconnected from Server" tren Windows

> **Thoi gian xu ly:** ~2 gio | **Ngay:** 2026-06-15
> **Moi truong:** Tomcat 9.0.118 + OpenJDK 17.0.17 (Microsoft) + Windows 11

---

## Trieu chung

- Chay `D:\Apps\apache_tomcat_9.0.118\bin\catalina.bat run` => man hinh hien **"Disconnected from server"**
- Thu muc `logs/` hoan toan **trong** (khong co file `.log` nao)
- Khong co bat ky error message nao hien ra o terminal
- Port `8080` khong duoc listen

---

## Chan doan

### Buoc 1: Kiem tra moi truong
```powershell
java -version          # OK: OpenJDK 17.0.17
$env:JAVA_HOME         # <- DAY LA VAN DE #1
```

### Buoc 2: Chay Bootstrap Java truc tiep de bat loi that
```powershell
$classpath = "D:\Apps\apache_tomcat_9.0.118\bin\bootstrap.jar;..."
& "C:\Users\dc130\.jdks\ms-17.0.17\bin\java.exe" @javaArgs 2>&1
```

**Output loi that:**
```
java.io.FileNotFoundException: D:\Apps\apache_tomcat_9.0.118\logs\catalina.2026-06-15.log
  (Access is denied)
  at org.apache.juli.FileHandler.openWriter(FileHandler.java:446)
```

---

## Root Cause: 2 Bugs Song Song

### Bug #1 - JAVA_HOME tro sai (co `\bin` thua)

|         | Gia tri                               |
| ------- | ------------------------------------- |
| WRONG   | `C:\Users\dc130\.jdks\ms-17.0.17\bin` |
| CORRECT | `C:\Users\dc130\.jdks\ms-17.0.17`     |

`JAVA_HOME` phai la thu muc root cua JDK.
Khi co `\bin` o cuoi, Tomcat tim `%JAVA_HOME%\bin\java.exe` => thanh `...\bin\bin\java.exe` => khong tim thay.

### Bug #2 - Thieu quyen ghi thu muc `logs/`

| Nhom | Quyen (truoc fix) |
|---|---|
| `BUILTIN\Users` | `ReadAndExecute` chi doc |
| `BUILTIN\Administrators` | `FullControl` |
| `DC\dc130` | Khong co entry rieng, inherit tu Users |

Khi Tomcat khoi tao, logging system chay **truoc** moi thu khac.
Neu khong ghi duoc log => **crash im lang**, khong co stack trace hien ra.
Ly do terminal chi hien "Disconnected" ma khong co thong tin them.

---

## Giai phap

### Fix 1: Tao `setenv.bat` - fix JAVA_HOME + them JVM args cho Java 17

**File:** `D:\Apps\apache_tomcat_9.0.118\bin\setenv.bat`

```bat
@echo off
set "JAVA_HOME=C:\Users\dc130\.jdks\ms-17.0.17"
set "JRE_HOME=%JAVA_HOME%"
set "CATALINA_OPTS=--add-opens=java.base/java.io=ALL-UNNAMED --add-opens=java.base/java.lang=ALL-UNNAMED --add-opens=java.rmi/sun.rmi.transport=ALL-UNNAMED"
```

> `setenv.bat` duoc Tomcat tu dong load truoc `catalina.bat`.
> Day la noi chuan de cau hinh env ma khong can sua bien he thong.

### Fix 2: Grant quyen `FullControl` cho user hien tai

Chay PowerShell voi quyen **Admin**:

```powershell
$user = 'DC\dc130'
$folders = @(
    'D:\Apps\apache_tomcat_9.0.118\logs',
    'D:\Apps\apache_tomcat_9.0.118\temp',
    'D:\Apps\apache_tomcat_9.0.118\work',
    'D:\Apps\apache_tomcat_9.0.118\bin'
)
foreach ($folder in $folders) {
    $acl = Get-Acl $folder
    $rule = New-Object System.Security.AccessControl.FileSystemAccessRule(
        $user, 'FullControl', 'ContainerInherit,ObjectInherit', 'None', 'Allow'
    )
    $acl.SetAccessRule($rule)
    Set-Acl $folder $acl
    Write-Host "Granted FullControl on: $folder"
}
```

---

## Bai Hoc (Lesson Learned)

> **"Tomcat crash im lang = khong ghi duoc log."**
> Khi `logs/` trong sau khi chay => dung debug code, hay debug **quyen thu muc truoc**.

### Checklist khi Tomcat khong start tren Windows:

- [ ] `logs/` co file nao khong? Neu khong => Permission problem.
- [ ] `JAVA_HOME` co `\bin` thua khong?
- [ ] User hien tai co quyen `Write` vao `logs/`, `temp/`, `work/` khong?
- [ ] Co file `setenv.bat` trong `bin/` de override env an toan khong?
- [ ] Tomcat 9 + Java 9+ can `--add-opens` JVM flags khong?

### Tai sao mat 2 gio?

1. Terminal chi hien "Disconnected" - khong co loi ro rang.
2. `logs/` trong => khong co catalina.log de doc.
3. Hai bugs cung luc => fix bug #1 xong van khong chay (vi con bug #2).
4. **Diem mau chot:** Phai chay Bootstrap.java **truc tiep** qua PowerShell de bat duoc stack trace that.

---

## Lien ket

- [[Java_3_Layer_Architecture]]
- [[JSP_vs_Servlet]]
- [[Git_Basics]]

---

*Ghi nho: Lan sau cai Tomcat moi => chay ngay script fix permissions o tren.*
