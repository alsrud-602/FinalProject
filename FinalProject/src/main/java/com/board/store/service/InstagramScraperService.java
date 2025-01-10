/*package com.board.store.service;

import org.openqa.selenium.*;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.chrome.ChromeOptions;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.WebDriverWait;
import org.springframework.stereotype.Service;

import java.time.Duration;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class InstagramScraperService {
    private WebDriver driver;
    private final Map<String, String> selectors = Map.of(
            "id_input", "._aa4b._add6._ac4d._ap35",
            "first_post", "div.x1lliihq.x1n2onr6.xh8yej3.x4gyw5p.x1ntc13c.x9i3mqj.x11i5rnm.x2pgyrj:first-of-type > a.x1i10hfl.xjbqb8w.x1ejq31n.xd10rxx.x1sy0etr:first-of-type\r\n",
            "next_btn", "div._aaqg._aaqh > button._abl-",
            "img_next_btn", "button._afxw._al46._al47",
            "cover", "div.x1qjc9v5.x972fbf.xcfux6l.x1qhh985.xm0m39n.x9f619.x78zum5.xdt5ytf.x2lah0s.xk390pu.xdj266r.x11i5rnm.xat24cr.x1mh8g0r.xexx8yu.x4uap5.x18d9i69.xkhd6sd.x1n2onr6.xggy1nq.x11njtxf > div > div._aagu._aato > div._aagv > img",
            "text", "div._a9zr > div._a9zs > h1._ap3a._aaco._aacu._aacx._aad7._aade",
            "date", ".x1p4m5qa"
    );

    private final List<String> brands = List.of("popcon_daewonmedia", "pops.official_");

    public InstagramScraperService() {
    	System.setProperty("webdriver.chrome.driver", "C:\\Users\\kimyujin\\Downloads\\chromedriver-win64\\chromedriver-win64\\chromedriver.exe");
        ChromeOptions options = new ChromeOptions();
        //options.addArguments("--headless"); // GUI 확인을 위해 주석 처리
        options.addArguments("--disable-gpu");
        options.addArguments("--no-sandbox");
        options.addArguments("user-agent=Mozilla/5.0 (Windows NT 11.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.6778.204 Safari/537.36");
        this.driver = new ChromeDriver(options);
    }

    public Map<String, List<String>> scrapeInstagramData(String username, String password) {
        try {
            driver.get("https://instagram.com");
            driver.manage().window().maximize();
            Thread.sleep(1000);

            // 로그인
            List<WebElement> inputs = driver.findElements(By.cssSelector(selectors.get("id_input")));
            inputs.get(0).sendKeys(username);
            inputs.get(1).sendKeys(password);
            inputs.get(1).sendKeys(Keys.ENTER);
            Thread.sleep(5000);

            // 데이터 수집
            List<String> texts = new ArrayList<>();
            List<String> images = new ArrayList<>();
            List<String> dates = new ArrayList<>();

            for (String brand : brands) {
                driver.get("https://instagram.com/" + brand + "/");
                Thread.sleep(5000);

                // 게시물 클릭
                WebElement post = driver.findElement(By.cssSelector(selectors.get("first_post")));
                post.click();
                Thread.sleep(2000);
                for (int i = 0; i < 10; i++) {
                    try {
                        WebDriverWait wait = new WebDriverWait(driver, Duration.ofSeconds(2));

                        // 이미지 수집
                        try {
                            WebElement cover = wait.until(ExpectedConditions.visibilityOfElementLocated(By.cssSelector(selectors.get("cover"))));
                            // 이미지 다음 버튼 클릭
                            for (int k = 0; k < 5; k++) {
                                try {
                                	images.add(cover.getAttribute("src"));
                                    WebElement imgNextButton = driver.findElement(By.cssSelector(selectors.get("img_next_btn")));
                                    imgNextButton.click();
                                    Thread.sleep(1000);
                                } catch (Exception e) {
                                    System.out.println("다음 버튼 클릭 실패: " + e.getMessage());
                                    break; // 다음 이미지로 이동하지 않고 루프 종료
                                }
                            }
                        } catch (Exception e) {
                            System.out.println("이미지 수집 실패: " + e.getMessage());
                            images.add(""); // 기본값 추가
                        }

                        // 텍스트 수집
                        try {
                            WebElement textElement = wait.until(ExpectedConditions.visibilityOfElementLocated(By.cssSelector(selectors.get("text"))));
                            texts.add(textElement.getText());
                            
                        } catch (Exception e) {
                            System.out.println("텍스트 수집 실패: " + e.getMessage());
                            texts.add(""); // 기본값 추가
                        }

                        // 날짜 수집
                        try {
                            WebElement dateElement = driver.findElement(By.cssSelector(selectors.get("date")));
                            dates.add(dateElement.getAttribute("datetime"));
                        } catch (Exception e) {
                            System.out.println("날짜 수집 실패: " + e.getMessage());
                            dates.add(""); // 기본값 추가
                        }

                        // 다음 버튼 클릭
                        if (i < 9) {
                            try {
                                WebElement nextButton = driver.findElement(By.cssSelector(selectors.get("next_btn")));
                                nextButton.click();
                                Thread.sleep(1000);
                            } catch (Exception e) {
                                System.out.println("다음 버튼 클릭 실패: " + e.getMessage());
                                break; // 다음 게시물로 이동하지 않고 루프 종료
                            }
                        }
                    } catch (Exception e) {
                        System.out.println("예외 발생: " + e.getMessage());
                        images.add("");
                        texts.add("");
                        dates.add("");
                    }
                }
            }

            Map<String, List<String>> data = new HashMap<>();
            data.put("text", texts);
            data.put("image", images);
            data.put("date", dates);

            return data;
        } catch (InterruptedException e) {
            e.printStackTrace();
            return Map.of();
        } finally {
            driver.quit();
        }
    }

}
*/