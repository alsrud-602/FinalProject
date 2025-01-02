import { GoogleGenerativeAI } from "@google/generative-ai";
import * as fs from 'node:fs';

// Gemini API 초기화
const genAI = new GoogleGenerativeAI("GEMINI_API_KEY");
const model = genAI.getGenerativeModel({ model: "gemini-1.5-flash" });

// 이미지 파일을 Base64로 변환하는 함수
function fileToGenerativePart(path, mimeType) {
  return {
    inlineData: {
      data: Buffer.from(fs.readFileSync(path)).toString("base64"),
      mimeType,
    },
  };
}

// Gemini API를 호출하고 응답을 처리하는 함수
async function fetchGeminiData() {
  const prompt = "Describe how this product might be manufactured.";
  const imagePart = fileToGenerativePart("/path/to/image.png", "image/png");

  try {
    const result = await model.generateContent([prompt, imagePart]);
    const responseText = result.response.text();

    // 예시로 응답이 아래와 같은 형식이라 가정
    // {
    //   title: 'Product Title',
    //   location: 'Location Info',
    //   schedule: '2024-01-01 to 2024-01-31',
    //   content: 'Product description and details...',
    //   additionalInfo: 'Other relevant information'
    // }
    
    const responseData = parseGeminiResponse(responseText);
    return responseData;

  } catch (error) {
    console.error('Error fetching data from Gemini API:', error);
    throw error;
  }
}

// Gemini API 응답을 파싱하여 필요한 데이터를 추출하는 함수
function parseGeminiResponse(responseText) {
  // 여기에 응답 텍스트를 파싱하는 로직을 작성해야 합니다.
  // 예시로 간단하게 처리한 부분입니다.
  
  const data = {
    title: extractTitle(responseText),
    location: extractLocation(responseText),
    schedule: extractSchedule(responseText),
    content: extractContent(responseText),
    additionalInfo: extractAdditionalInfo(responseText),
  };
  
  return data;
}

// 각 항목을 추출하는 함수들
function extractTitle(text) {
  // 실제 API 응답에 맞는 파싱 로직을 구현합니다.
  return "Extracted Title"; // 예시
}

function extractLocation(text) {
  return "Extracted Location"; // 예시
}

function extractSchedule(text) {
  return "Extracted Schedule"; // 예시
}

function extractContent(text) {
  return "Extracted Content"; // 예시
}

function extractAdditionalInfo(text) {
  return "Extracted Additional Info"; // 예시
}

// 메인 함수 실행
fetchGeminiData().then(data => {
  console.log('Parsed Data:', data);
}).catch(error => {
  console.error('Error:', error);
});
