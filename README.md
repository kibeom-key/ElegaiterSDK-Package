# ElegaiterSDK (Swift Package)

바이너리 전용 Swift Package입니다.  
소스 코드는 포함되지 않으며, GitHub Release에 올린 XCFramework ZIP을 참조합니다.

---

## GitHub Release에 ZIP 올린 뒤 할 일 (배포 측)

1. **체크섬 계산**  
   올려둔 ZIP 파일로 SHA256 체크섬을 구합니다.
   ```bash
   swift package compute-checksum /path/to/ElegaiterSDK.xcframework.zip
   ```
2. **이 저장소 준비**  
   - `ElegaiterSDK-Package` 폴더를 **별도 Git 저장소**로 둡니다 (또는 기존 “패키지 설명만”용 repo).
   - `Package.swift`에서 다음을 수정합니다.
     - `url`: GitHub Release ZIP URL  
       예: `https://github.com/OWNER/REPO/releases/download/1.0.0/ElegaiterSDK.xcframework.zip`
     - `checksum`: 위에서 구한 SHA256 문자열
3. **버전 태그**  
   - 수정한 내용을 커밋한 뒤, **패키지 버전**에 맞게 태그합니다.  
     예: `1.0.0` → `git tag 1.0.0 && git push origin 1.0.0`
4. **타업체 안내**  
   - “Swift Package로 추가하세요” + 이 저장소 URL + 사용할 버전(또는 Up to Next Major) 안내.

이후 XCFramework를 새 버전으로 올릴 때마다:  
Release 새로 만들고 → ZIP URL/버전에 맞게 `Package.swift` 수정 → 같은 버전으로 이 저장소 태그.

## 타업체(B2B) 사용 방법

1. Xcode에서 **File → Add Package Dependencies...**
2. 저장소 URL 입력: `https://github.com/YOUR_ORG/YOUR_REPO`
3. **Dependency Rule**: Up to Next Major Version (예: `1.0.0` ~ `< 2.0.0`) 권장
4. 추가 후 프로젝트 타겟에서 **Frameworks, Libraries, and Embedded Content**에 `ElegaiterSDK` 추가
5. 이후 새 버전이 나오면 Xcode에서 **File → Packages → Update to Latest Package Versions** 로 업데이트

## 개발/배포 측 (이 패키지 수정 시)

- `Package.swift`의 `url`은 **GitHub Release의 ZIP 다운로드 URL**이어야 합니다.
- 형식: `https://github.com/OWNER/REPO/releases/download/TAG/ElegaiterSDK.xcframework.zip`
- `checksum`은 **반드시** ZIP 파일의 SHA256 체크섬으로 맞춰야 합니다.

### 체크섬 계산

```bash
# ZIP 파일이 있을 때 (로컬)
swift package compute-checksum /path/to/ElegaiterSDK.xcframework.zip

# 또는
shasum -a 256 ElegaiterSDK.xcframework.zip
```

계산한 값을 `Package.swift`의 `checksum: "..."` 에 넣고, 해당 버전으로 이 저장소를 태그해 두면 SPM에서 정상 해석됩니다.
