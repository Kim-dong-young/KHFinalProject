// document.addEventListener("DOMContentLoaded", () => {
//     const jmCd = "1320"; // 종목 코드
//     const serviceKey = "AiATDYDO2nw7aWzpDtDvC8aswTEabFvLtwjy0RwuM2KnGpfE%2BD4ffB3SmCH4VqDihRDB%2FNR8RmbluUBQL%2Bo10w%3D%3D";
//     const apiUrl = `http://openapi.q-net.or.kr/api/service/rest/InquiryInformationTradeNTQSVC/getList?jmCd=${jmCd}&ServiceKey=${serviceKey}`;

//     const examListContainer = document.querySelector("#exam-list");

//     examListContainer.innerHTML = "<p>데이터를 불러오는 중...</p>";

//     fetch(apiUrl)
//         .then(response => response.text())
//         .then(xmlString => {
//             const parser = new DOMParser();
//             const xmlDoc = parser.parseFromString(xmlString, "application/xml");

//             const resultCode = xmlDoc.querySelector("resultCode").textContent;
//             if (resultCode !== "00") {
//                 throw new Error("API 호출 실패: " + xmlDoc.querySelector("resultMsg").textContent);
//             }

//             const items = xmlDoc.querySelectorAll("item");

//             if (items.length === 0) {
//                 throw new Error("데이터가 없습니다.");
//             }

//             // 내용 초기화
//             examListContainer.innerHTML = "";

//             items.forEach(item => {
//                 const jmfldnm = item.querySelector("jmfldnm")?.textContent || "";
//                 const infogb = item.querySelector("infogb")?.textContent || "";
//                 const contents = item.querySelector("contents")?.textContent || "";

//                 // 텍스트 정리
//                 const cleanContents = contents
//                     .replace(/<[^>]*>/g, "") // HTML 태그 제거
//                     .replace(/BODY \{.*?\}P \{.*?\}LI \{.*?\}/g, "") // CSS 스타일 제거
//                     .replace(/[\u2460-\u2473]/g,"<br>") // 원문자 줄바꿈
//                     .replace(/(\d+\.)/g, "<br>$1") // 번호 뒤 줄바꿈
//                     .replace(/<세부 평가 내역>/g, "<br><strong>세부 평가 내역:</strong><br>") // 특정 텍스트 변환
//                     // .replace(/\s*-\s*/g, "<br>- ") // '-'로 시작하는 항목 줄바꿈
//                     .replace(/\n+/g, "<br>"); // 일반 줄바꿈 처리

//                 const listItem = document.createElement("li");

//                 listItem.innerHTML = `
//                     <strong>종목명:</strong> ${jmfldnm} <br><br>
//                     <strong>출제범위:</strong> ${infogb} <br><br>
//                     <strong>내용:</strong> ${cleanContents}<br><br>
//                 `;

//                 examListContainer.appendChild(listItem);
//             });
//         })
//         .catch(error => {
//             console.error("API 호출 실패:", error);
//             examListContainer.innerHTML = "<p>정보를 불러오는 데 실패했습니다.</p>";
//         });
// });
