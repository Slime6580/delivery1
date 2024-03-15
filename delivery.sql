-- --------------------------------------------------------
-- 호스트:                          127.0.0.1
-- 서버 버전:                        11.3.1-MariaDB - mariadb.org binary distribution
-- 서버 OS:                        Win64
-- HeidiSQL 버전:                  12.3.0.6589
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- chicken 데이터베이스 구조 내보내기
CREATE DATABASE IF NOT EXISTS `chicken` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;
USE `chicken`;

-- 테이블 chicken.brand 구조 내보내기
CREATE TABLE IF NOT EXISTS `brand` (
  `BRANDNAME` varchar(50) NOT NULL,
  `LOCATION` varchar(50) DEFAULT NULL,
  `MENU` varchar(80) DEFAULT NULL,
  `BRANDIMG` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`BRANDNAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- 테이블 데이터 chicken.brand:~4 rows (대략적) 내보내기
INSERT INTO `brand` (`BRANDNAME`, `LOCATION`, `MENU`, `BRANDIMG`) VALUES
	('교촌 치킨', '동구 가오동', '허니오리지날 / 레허반반순살 / 블랙시크릿오리지날', 'kyochon'),
	('노랑 통닭', '동구 가오동', '엄청 큰 후라이드 치킨 / 노랑 3종 치킨 / 바삭 누룽지 치킨', 'norang'),
	('또봉이 통닭', '동구 가오동', '또봉이 통닭 / 양념통닭 / 갈비통닭', 'ttobong'),
	('처갓집 치킨', '동구 가오동', '허니올리고당야채 양념치킨 / 트러플 슈프림 양념치킨 / THE화이트치킨', 'chogod');

-- 테이블 chicken.menu 구조 내보내기
CREATE TABLE IF NOT EXISTS `menu` (
  `BRANDNAME` varchar(50) DEFAULT NULL,
  `CMENU` varchar(50) NOT NULL,
  `CONTENT` varchar(80) DEFAULT NULL,
  `PRICE` int(11) DEFAULT NULL,
  `CAL` int(11) DEFAULT NULL,
  `MENUIMG` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`CMENU`),
  KEY `BRANDNAME` (`BRANDNAME`),
  CONSTRAINT `menu_ibfk_1` FOREIGN KEY (`BRANDNAME`) REFERENCES `brand` (`BRANDNAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- 테이블 데이터 chicken.menu:~12 rows (대략적) 내보내기
INSERT INTO `menu` (`BRANDNAME`, `CMENU`, `CONTENT`, `PRICE`, `CAL`, `MENUIMG`) VALUES
	('처갓집 치킨', 'THE 화이트치킨', '처갓집의 대표메뉴 “슈프림양념치킨”을 부드럽고 쫀득한 더 화이트 치킨으로!', 20000, 1700, 'cmenu3'),
	('또봉이 통닭', '갈비통닭', '갈비인가 통닭인가, 감칠맛나는 갈비맛양념과 닭고기의 조화가 환상적인 치킨', 15000, 1900, 'tmenu3'),
	('노랑 통닭', '노랑 3종 세트 SET ', '후라이드, 양념, 깐풍 치킨을 한번에', 21000, 2180, 'nmenu2'),
	('또봉이 통닭', '또봉이통닭', '특제 파우더를 입혀 만들어진 치킨. 육즙이 빠져나가지 않게 해주어 속은 부드럽고 겉은 바삭함을 자랑합니다.', 12000, 500, 'tmenu1'),
	('교촌 치킨', '레허반반순살', '레드로 매콤하게, 허니로 달콤하게, 맵단맵단으로 즐길 수 있는 100%국내산 정육, 안심 순살 메뉴', 23000, 2184, 'kmenu2'),
	('노랑 통닭', '바삭 누룽지 치킨', '간장 베이스의 짭조름함과 달콤한 벌꿀 그리고 바삭한 누룽지 칩', 20000, 2100, 'nmenu3'),
	('교촌 치킨', '블랙시크릿오리지날', '다섯가지 맛과 향을 내는 오향에 맛 간장과 흑임자, 청양고추를 더한 깊은 풍미의 한 마리 치킨', 20000, 2879, 'kmenu3'),
	('또봉이 통닭', '양념통닭', '또봉이 특제비법 파우더를 입혀 만들어진 또봉이치킨에 달달,매콤 양념을 덧바른 남녀노소 최고의 베스트셀러', 14000, 1500, 'tmenu2'),
	('처갓집 치킨', '트러플 슈프림 양념치킨', '바삭바삭 치킨위에 허니올리고당야채양념과 신비의 하얀소스가 사르르~', 21000, 2700, 'cmenu2'),
	('노랑 통닭', '푸짐한 오리지널 ', '가마솥에 튀긴 기존 푸짐한 오리지널 순살', 18000, 1909, 'nmenu1'),
	('교촌 치킨', '허니오리지날', '달콤 바삭한 맛이 일품인 한 마리 치킨', 19000, 2895, 'kmenu1'),
	('처갓집 치킨', '허니올리고당야채 양념치킨', '20가지의 신선한 야채를 주원료로한 매콤달콤한 처갓집의 독특한 양념소스가 어우러져 영양만점의 양념치킨', 19000, 2700, 'cmenu1');

-- 테이블 chicken.side 구조 내보내기
CREATE TABLE IF NOT EXISTS `side` (
  `BRANDNAME` varchar(50) DEFAULT NULL,
  `SIDEMENU` varchar(50) DEFAULT NULL,
  `PRICE` int(11) DEFAULT NULL,
  KEY `BRANDNAME` (`BRANDNAME`),
  CONSTRAINT `side_ibfk_1` FOREIGN KEY (`BRANDNAME`) REFERENCES `brand` (`BRANDNAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- 테이블 데이터 chicken.side:~12 rows (대략적) 내보내기
INSERT INTO `side` (`BRANDNAME`, `SIDEMENU`, `PRICE`) VALUES
	('교촌 치킨', '옥수수 볼', 5000),
	('교촌 치킨', '퐁듀치즈볼(6ea)', 6000),
	('교촌 치킨', '웨지감자', 4000),
	('노랑 통닭', '눈꽃 치즈 떡볶이', 7000),
	('노랑 통닭', '노랑 치즈볼 오리지널', 4000),
	('노랑 통닭', '오칩스', 14000),
	('또봉이 통닭', '국물떡볶이', 13000),
	('또봉이 통닭', '무뼈닭발', 16000),
	('또봉이 통닭', '치즈볼 5개', 6000),
	('처갓집 치킨', '골드치즈볼 6개', 6000),
	('처갓집 치킨', '슈프림 라이스', 2000),
	('처갓집 치킨', '소떡소떡', 3000);

-- 테이블 chicken.users 구조 내보내기
CREATE TABLE IF NOT EXISTS `users` (
  `id` varchar(15) DEFAULT NULL,
  `pw` varchar(15) DEFAULT NULL,
  `nickname` varchar(10) DEFAULT NULL,
  `destination` varchar(40) DEFAULT NULL,
  `PhoneNum` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- 테이블 데이터 chicken.users:~1 rows (대략적) 내보내기
INSERT INTO `users` (`id`, `pw`, `nickname`, `destination`, `PhoneNum`) VALUES
	('test', 'test123', 'test1', '가오동', '123-456-789');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
