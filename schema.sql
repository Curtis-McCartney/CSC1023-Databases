-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Mar 13, 2024 at 10:54 AM
-- Server version: 10.5.21-MariaDB-0+deb11u1
-- PHP Version: 8.1.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cmccartney29`
--

-- --------------------------------------------------------

--
-- Stand-in structure for view `AllJobListingsFrom14DaysAgo`
-- (See below for the actual view)
--
CREATE TABLE `AllJobListingsFrom14DaysAgo` (
`ListingID` int(11)
,`CompanyID` int(11)
,`Title` varchar(255)
,`Description` text
,`Salary` decimal(10,2)
,`ContractTypeID` int(11)
,`SectorID` int(11)
,`StreetAddress` varchar(255)
,`City` varchar(100)
,`PostCode` varchar(20)
,`PostDate` date
);

-- --------------------------------------------------------

--
-- Table structure for table `Applications`
--

CREATE TABLE `Applications` (
  `ApplicationID` int(11) NOT NULL,
  `JobSeekerCVID` int(11) NOT NULL,
  `JobListingID` int(11) NOT NULL,
  `ApplicationDate` date NOT NULL,
  `ApplicationStatusID` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Applications`
--

INSERT INTO `Applications` (`ApplicationID`, `JobSeekerCVID`, `JobListingID`, `ApplicationDate`, `ApplicationStatusID`) VALUES
(1, 1, 1, '2024-03-08', 2),
(2, 2, 7, '2024-02-28', 1),
(3, 3, 16, '2024-01-20', 4),
(4, 3, 9, '2024-03-04', 3),
(5, 4, 12, '2024-03-01', 2),
(6, 5, 12, '2024-03-02', 2),
(7, 6, 4, '2024-02-27', 2),
(8, 6, 16, '2024-01-22', 3),
(9, 7, 20, '2024-01-17', 3),
(10, 7, 19, '2024-01-17', 2);

-- --------------------------------------------------------

--
-- Table structure for table `ApplicationStatus`
--

CREATE TABLE `ApplicationStatus` (
  `StatusID` int(11) NOT NULL,
  `StatusName` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `ApplicationStatus`
--

INSERT INTO `ApplicationStatus` (`StatusID`, `StatusName`) VALUES
(1, 'Submitted'),
(2, 'Shortlisted'),
(3, 'Accepted'),
(4, 'Declined');

-- --------------------------------------------------------

--
-- Table structure for table `Company`
--

CREATE TABLE `Company` (
  `CompanyID` int(11) NOT NULL,
  `CompanyName` varchar(100) NOT NULL,
  `Email` varchar(100) NOT NULL,
  `Phone` varchar(15) NOT NULL,
  `StreetAddress` varchar(255) DEFAULT NULL,
  `City` varchar(100) DEFAULT NULL,
  `Postcode` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Company`
--

INSERT INTO `Company` (`CompanyID`, `CompanyName`, `Email`, `Phone`, `StreetAddress`, `City`, `Postcode`) VALUES
(1, 'Subway', 'info@subway.com', '07751234689', '62 Main Street', 'Bangor ', 'BT20 5AG'),
(2, 'Sweet Afton', 'info@sweetaftonbelfast.com', '07890248000', '12 Brunswick Street', 'Belfast', 'BT2 7GG'),
(3, 'Rapid7', 'info@rapid7.com', '07695680727', '19 Chichester Street', 'Belfast ', 'BT1 4JB'),
(7, 'Tesla', 'info@tesla.com', '07711769823', '15 Boucher Rd', 'Belfast ', 'BT12 6NT'),
(8, 'DHL', 'info@dhl.com', '07442480844', 'Edgewater Business Park, Harbour, Edgewater Road', 'Belfast ', 'BT3 9JQ'),
(9, 'EE', 'info@ee.com', '07739182746', 'Unit 25A, Buttercrane Shopping Centre', 'Newry', 'BT35 8HJ'),
(10, 'Uber', 'info@uber.com', '07740192873', NULL, NULL, NULL),
(11, 'Creightons', 'info@intel.com', '07890623131', '87-89 Upper Lisburn Rd ', 'Belfast', 'BT10 0GY'),
(12, 'The Range', 'info@therange.com', '07890837103', '5 Boucher Road', 'Belfast ', 'BT12 6HR'),
(13, 'Sony', 'info@sony.com', '07778594023', '14 Ash Street', 'Ballymena', 'BT43 6WX'),
(14, 'Ballyclare Golf Club', 'info@ballyclaregolfclub.com', '07893322696', '25 Springvale Road', 'Ballyclare ', 'BT39 9JW'),
(15, 'Version1', 'info@version1.com', '07038594790', '8 Lanyon Place', 'Belfast ', 'BT1 3LP'),
(16, 'Brook Street', 'info@brookstreet.com', '07701725486', '94 Victoria Street', 'Belfast ', 'BT1 3GN'),
(17, 'Sainsbury\'s', 'info@sainsburys.com', '07292508281', '5 Sprucefield Park', 'Lisburn ', 'BT27 5UQ'),
(18, 'Home Bargains', 'info@homebargains.com', '02890614861', '19 Falls Road', 'Belfast ', 'BT11 9AE'),
(19, 'Halfords', 'info@halfords.com', '07745789023', '31-33 Hillsborough Road', 'Lisburn ', 'BT28 1JL'),
(20, 'Dominos Pizza', 'info@dominoespizza.com', '02890757475', '235 Antrim Road', 'Belfast ', 'BT15 2GZ'),
(21, 'IBM', 'info@ibm.com', '07767809132', '4 Pine Lane', 'Ballymoney', 'BT53 6XY'),
(22, 'Starbucks', 'info@starbucks.com', '07751234567', '24 Great Victoria Street', 'Belfast', 'BT2 7XL'),
(23, 'Flannels', 'info@flannels.com', '07157234267', '41 Victoria Square', 'Belfast', 'BT1 4QG'),
(24, 'Malone Healthcare', 'info@malonehealthcare.com', '07439092196', '6 Annadale Ave', 'Belfast', 'BT7 3JH'),
(25, 'Foot Locker', 'info@footlocker.com', '07895905992', '56 Donegall Place', 'Belfast', 'BT1 5BB'),
(26, 'Solas', 'info@solas.com', '07890247600', '284a Ormeau Rd', 'Belfast', 'BT7 2GB'),
(27, 'Caremark NI', 'info@caremark.com', '07891467004', '3 Balloo Place', 'Bangor', 'BT19 7BP'),
(28, 'Tara Lodge', 'info@taralodge.com', '07890590900', '36 Cromwell Road', 'Belfast', 'BT7 1JW'),
(29, 'YO! Burger', 'info@yoburger.com', '07891299753', '1 Victoria Square', 'Belfast', 'BT1 4QG'),
(30, 'Abbey Pharmacy', 'info@abbeypharmacy', '07891271091', '82 Abbey Street', 'Bangor', 'BT20 4JB'),
(31, 'Lidl', 'info@lidl.com', '02895684888', 'Hillview Retail Park', 'Belfast', 'BT14 7EE'),
(32, 'North-West Tyres', 'info@nwtyres.com', '02871268649', '177 Strand Road', 'Derry/Londonderry', 'BT48 7PU'),
(33, 'Creative Gardens', 'info@creativegardens.com', '02891883603', '34 Stockbridge Road', 'Donaghadee', 'BT21 0PN'),
(34, 'Harry Corry', 'info@harrycorry.com', '02838346390', '2 Central Way', 'Craigavon', 'BT64 1AA'),
(35, 'Decora', 'info@decora.com', '02892663600', '1 Knockmore Road', 'Lisburn', 'BT28 2FL'),
(36, 'Harland & Wolff', 'info@harland-wolff.com', '03301240427', 'Queen\'s Island', 'Belfast', 'BT3 9EU'),
(37, 'Belfast City Airport', 'info@belfastcityairport.com', '02890939093', 'Belfast Road', 'Belfast', 'BT3 9JH'),
(38, 'Trespass', 'info@trespass.com', '02890663747', '3 Boucher Crescent', 'Belfast', 'BT12 6HU'),
(39, 'Boots', 'info@boots.com', '02890681570', '2 Boucher Crescent', 'Belfast', 'BT12 6HU'),
(40, 'Regatta', 'info@regatta.com', '02890024194', '1 Boucher Crescent', 'Belfast', 'BT12 6HU'),
(41, 'Card Factory', 'info@cardfactory.com', '02890236599', 'Connswater Shopping Centre', 'Belfast', 'BT5 5LP'),
(42, 'Wetherspoon', 'info@jdwetherspoon.com', '02890727890', '35-43 Bedford Street', 'Belfast', 'BT2 7EJ'),
(43, 'Nandos', 'info@nandos.com', '02890661741', '12 Boucher Crescent', 'Belfast', 'BT12 6HT'),
(44, 'Boyle Sports', 'info@boylesports.com', '0800220066', '89 Main Street', 'Armagh ', 'BT60 1PJ'),
(45, 'Clarks', 'info@clarks.com', '02895442025', '14 Donegall Place', 'Belfast', 'BT1 5BA'),
(46, 'Homebase', 'info@homebase.com', '07456407250', '105 Boucher Road', 'Belfast', 'BT12 6UA'),
(47, 'Leonardo Hotels', 'info@leonardohotels.com', '02890533500', '44 Great Victoria Street', 'Belfast', 'BT1 6DY');

-- --------------------------------------------------------

--
-- Stand-in structure for view `CompanyAverageSalaryForJobListings`
-- (See below for the actual view)
--
CREATE TABLE `CompanyAverageSalaryForJobListings` (
`CompanyID` int(11)
,`CompanyName` varchar(100)
,`TotalListings` bigint(21)
,`AverageSalary` decimal(14,6)
);

-- --------------------------------------------------------

--
-- Table structure for table `ContractTypes`
--

CREATE TABLE `ContractTypes` (
  `ContractTypeID` int(11) NOT NULL,
  `ContractType` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `ContractTypes`
--

INSERT INTO `ContractTypes` (`ContractTypeID`, `ContractType`) VALUES
(1, 'Permanent'),
(2, 'Temporary'),
(3, 'Contract');

-- --------------------------------------------------------

--
-- Table structure for table `JobListings`
--

CREATE TABLE `JobListings` (
  `ListingID` int(11) NOT NULL,
  `CompanyID` int(11) NOT NULL,
  `Title` varchar(255) NOT NULL,
  `Description` text NOT NULL,
  `Salary` decimal(10,2) DEFAULT NULL,
  `ContractTypeID` int(11) NOT NULL,
  `SectorID` int(11) NOT NULL,
  `StreetAddress` varchar(255) DEFAULT NULL,
  `City` varchar(100) DEFAULT NULL,
  `PostCode` varchar(20) DEFAULT NULL,
  `PostDate` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `JobListings`
--

INSERT INTO `JobListings` (`ListingID`, `CompanyID`, `Title`, `Description`, `Salary`, `ContractTypeID`, `SectorID`, `StreetAddress`, `City`, `PostCode`, `PostDate`) VALUES
(1, 1, 'Subway Team Member', 'We are looking for FULL-TIME Subway Team Members for our store in Newtownards, who are available to work weekdays as well as the occasional weekends. The ideal candidate will greet and serve customers, prepare products, maintain food safety standards, and handle or processes light paperwork. Exceptional customer service is a major component of this position.\n\nDuties and responsibilities include but are not limited to:\n\nServe customers and prepare orders\n\nHighly motivated and able to work part of a team or as an individual\n\nFlexible working hours to include evenings and weekends\n\nKnowledge of the Subway menu.\n\nPrepare food and restock items in the sandwich unit\n\nUnderstand food handling, safety, and sanitation standards\n\nClean and maintain all areas of the restaurant\n\nPerform light paperwork duties\n\nBenefits of working at Subway\n\nFree food and drink whilst on shift\n\nContinued development and career opportunities\n\nEmployee recognition schemes\n\nLong service recognition\n\nPerformance review and reward scheme\n\nQualifications and Skills\n\nAny previous Subway experience or experience with Food Handing in the Customer Service or Retail Industry would be preferred, however not necessary as successful candidates will be taken through detailed training.\n\nJob Types: Full-time, Permanent\n\nSalary: £7.75-£10.50 per hour\n\nBenefits:\n\nDiscounted or free food\nOn-site parking\nSchedule:\n\n8 hour shift\nDay shift\nMonday to Friday\nWeekend availability\nExperience:\n\ncustomer Service: 1 year (preferred)\nfood preparation & handling: 1 year (preferred)\nHospitality: 1 year (preferred)\nLicence/Certification:\n\nDriving Licence (preferred)\nWork authorisation:\n\nUnited Kingdom (required)\nWork Location: In person', 7.75, 1, 14, 'Ards Shopping Centre Unit 4', 'Newtownards', 'BT23 4EU', '2024-02-03'),
(2, 7, 'Field Service Technician - Energy & Supercharging, Ireland', 'Tesla participates in the E-Verify Program\r\n\r\nWhat to Expect\r\nAs a Field Service Technician in our Energy and Charging Field Service team, you will play a vital role in making sure both our Energy Storage products and our Superchargers are operating at their best. Our Energy Storage products are critical in solving the intermittency of renewable energy sources such as wind and solar to accelerate the transition to a greener electricity network. Our Supercharging network is the largest global, fast charging network in the world and enables our customers to travel long distances comfortably. In your day-to-day responsibilities, you will perform preventive maintenance, upgrades, troubleshooting and repairs along with commissioning activities across various locations in Ireland and the United Kingdom. Are you a technician with a background in electricity and power? Do you want to be part of a fast-growing company and work with the newest technologies? Then Tesla is looking for you!\r\n\r\nWhat You’ll Do\r\nPerform all on-site technical activities related to the installation, commissioning, repair, maintenance of our Energy storage and Supercharging network in Ireland and abroad when needed\r\nTroubleshoot and perform root-cause analysis, both remotely and on-site\r\nAct as the first point of contact to contractors\r\nAnalyze recurring issues and provide feedback to the engineering teams\r\nPrepare, organize, and plan your own technical activities\r\nWhat You’ll Bring\r\nMinimum of 3 years of experience as a technician in the electrical engineering field, experience in a field-based role is a plus\r\nExperience with Low- and Medium Voltage electrical systems, High Voltage is a plus\r\nA passion for renewable energy\r\nExcellent communication skills and ability to work independently, motivated and a proactive attitude\r\nWillingness to travel extensively throughout the UK&I, including last minute-calls with overnight stay\r\nFluency in English\r\nValid driver’s license\r\nTesla is an Equal Opportunity / Affirmative Action employer committed to diversity in the workplace. All qualified applicants will receive consideration for employment without regard to race, color, religion, sex, sexual orientation, age, national origin, disability, protected veteran status, gender identity or any other factor protected by applicable federal, state or local laws.\r\n\r\nTesla is also committed to working with and providing reasonable accommodations to individuals with disabilities. Please let your recruiter know if you need an accommodation at any point during the interview process.', NULL, 1, 10, '15 Boucher Road', 'Belfast', 'BT12 6NT', '2024-03-04'),
(3, 10, 'Make An Uber Account To Drive - Start Earning With The Uber App', 'What is Uber?\n\nDriving with Uber offers a flexible earning opportunity. It’s a great alternative to full-time driver jobs, part-time driver jobs or other part-time gigs, temp jobs or seasonal employment. Or maybe you’re already using other rideshare apps and want to supplement your income by becoming a driver using the Uber platform.\n\nWhy Drive With Uber?:\n\nReceive your earnings fast: With Uber, you can pocket your earnings up to 5 times a day.\n\nMinimum earnings guaranteed: Earn at least the National Living Wage.\n\nAccess to sickness cover or a \"\"New Parent\"\" payment*: With our Allianz insurance scheme, you have protection from the financial cost of life-changing events with insurance from Allianz. *Eligibility criteria apply.\n\nSave for your future: You will have access to a pension plan that will include contributions from you and Uber.\n\nReceive holiday pay* You will receive an additional 12.07% of your earnings each week, making it easier to plan some downtime. *Eligibility criteria apply.\n\nYou are your own boss: You decide how much or little you want to drive and earn.\n\nNo car? No problem: We’ll give you access to hire and leasing deals through our sister company, Vehicle Marketplace.\n\nSigning up only takes a few minutes. We\'ll provide support along the way and get you on the road as soon as your registration is processed.\n\nRequirements to Drive:\n\nA valid UK driver\'s licence (EU driver\'s licence needs to be converted to UK driver\'s licence before onboarding).\n\nYou will need a private hire licence from a licensing authority such as a council. If you don\'t have one, we\'ll help you get started with a personalised Ignition appointment where we offer advice and support after you sign up.\n\nBe at least 21 years of age to apply for your private hire licence, as required by the UK government.\n\nDriver profile photo taken at our Greenlight Hub.\n\nComplete the EduMe Course, a virtual onboarding course that helps you familiarise with the Uber app and its features.\n\nRequired years of driving experience will vary depending on in which city you are based.\n\nAdditional Information:\n\nIf you have previous employment experience in transportation (such as a delivery driver, driver, professional driver, driving job, truck driver, heavy and tractor-trailer driver, local truck driver, company truck driver, taxi driver, taxi chauffeur, transit bus driver, bus driver, coach bus driver, bus operator, shuttle driver, bus chauffeur) you might also consider driving with Uber to earn extra money. We also welcome drivers who have worked with other peer-to-peer ridesharing or driving networks. Driving with Uber is a great way to supplement your part time or full time income. Drivers who use the Uber app come from all backgrounds and industries, setting their own schedules to make work fit into their lives, not the other way around. We\'ll help you get started.\n\nAdditional Documents to Drive:\n\nDepending on your state/city, additional documentation and information may be required. Our 24/7 support is available every day to answer questions about registration.', NULL, 1, 15, NULL, NULL, NULL, '2024-01-01'),
(4, 1, 'Subway Assistant Store Manager', 'The Subway Assistant Store Manager, aids the Store Manager and must be proficient in the tasks and responsibilities of the Sandwich Artist and Senior Sandwich Artist positions. The Assistant Store Manager must be a Team Player, with good communication skills who strives to consistently deliver the highest Operational and Customer Service standards, in all areas of personal and team performance.\r\n\r\nBenefits of being a Subway Assistant Store Manager:-\r\n\r\nQuarterly bonus opportunities\r\nAccess to Perks at works with discounts on brands such as Adidas, Samsung, Tesco, and much more.\r\nFree Food & Drink whilst on shift.\r\nContinued Development and Career opportunities.\r\nEmployee recognition schemes\r\nTeam bonding sessions\r\nResponsibilities and Duties\r\n\r\nThe Subway Assistant Store Manager duties include but not limited to:\r\n\r\nHelping with the recruitment of staff and overseeing the in-store training program.\r\nMotivating, mentoring and coaching team members.\r\nAll Inventory and cash control systems.\r\nWorking on and implementing local marketing initiatives and may contact prospective customers to promote sales.\r\nMaintaining accurate business records, working to remain within Company Budgets.\r\nDelivering and demonstrating exceptional customer service is a major component of this position.\r\nWe are interested in speaking with people that have a background or experience in the following-\r\n\r\nPrevious Managerial Experience within Fast-food, Deli Counter or Restaurants\r\nExcellent communication skills: especially verbal\r\nAbility to manage all levels of employees\r\nComputer knowledge is desirable\r\nCustomer Service\r\nFood Handling\r\n1 Year, experience in a Managerial or Supervisors role working within a challenging fast paced, team environment, in the Food/Quick Service Restaurant would be preferred. Any previous Subway Experience or knowledge would be also be beneficial.\r\n\r\nJob Types: Full-time, Permanent\r\n\r\nSalary: Up to £11.00 per hour\r\n\r\nExpected hours: 20 – 40 per week\r\n\r\nBenefits:\r\n\r\nEmployee discount\r\nStore discount\r\nSchedule:\r\n\r\nDay shift\r\nMonday to Friday\r\nWeekend availability\r\nSupplemental pay types:\r\n\r\nBonus scheme\r\nPerformance bonus\r\nExperience:\r\n\r\nHospitality: 1 year (preferred)\r\nFood service: 1 year (preferred)\r\nLicence/Certification:\r\n\r\nA Driving Licence (preferred)\r\nWork Location: In person', 11.00, 1, 14, 'Unit 7A, Crescent Link Retail Park', 'Londonderry', 'BT47 6SA', '2024-02-14'),
(5, 13, 'Sony Photography and Video Sales Promoter', 'About your new company:\r\nSony are the leading brand when it comes to photography, videography, technology, music, & gaming. They are making waves with their new initiatives into artificial intelligence & much more! Sony are delivering excitement, passion, joy & compassion to the world & they want you to be a part of this journey.\r\n\r\nYour new role:\r\nWe want you to be part of our fun-loving, creative and enthusiastic retail team. You will be the Sony specialist in store, representing the brand and educating our customers on the best photo & video products to suit their needs. We take our customers on a journey to find the best Sony product for them, demonstrate products bringing the brand to life and give them the best shopping experience we can!\r\n\r\nWe are part of a team supporting one of the biggest companies in the world, a company who truly believes in investing in people. We are given opportunities to progress within the team and are provided regular training from the UK Headquarters to make us more confident and comfortable as Sales Assistants.\r\n\r\nYou will be based at Boucher Plaza, Boucher Rd, Belfast BT12 6HR\r\n\r\nWhat\'s in it for you?\r\n\r\nYou will be working 15 hours per week across 2 days (Friday and Saturday 09:00 – 17:00) paid weekly\r\n£10.42 per hour with chances to earn additional bonuses of up to 20% OTE per annum when achieving sales targets.\r\nGet great discounts on Sony\'s ever-growing range of products including high-end cameras and camera accessory products!\r\nOvertime offered through peak periods!\r\nWho we’re looking for?\r\n\r\nAble to build a strong relationship with our customers.\r\nConfident & ambitious to take ownership and drive sales within the store.\r\nPassion for retail & delivering the highest standard of customer service to our loyal customers.\r\nStrong interest for Photography, Videography and Content Creation\r\nIf you love people, sales and photography or video and want to be part of this innovative family, then what are you waiting for?\r\n\r\nClick apply now!\r\n\r\nJob Types: Part-time, Temporary contract\r\nContract length: 12 months\r\n\r\nSalary: £10.42 per hour\r\n\r\nExpected hours: 15 per week\r\n\r\nBenefits:\r\n\r\nEmployee discount\r\nSupplemental pay types:\r\n\r\nBonus scheme\r\nWork Location: In person', 10.42, 3, 8, 'Unit 3a, 2-6 Boucher Road', 'Belfast', 'BT12 6QB', '2024-02-06'),
(6, 22, 'Part time Shift Supervisor', 'Vacancy for Starbucks Sainsburys Holywood\r\n\r\nStarbucks is a global coffee company with over 30,000 stores in 80 countries. We are looking for a highly motivated Shift Supervisor to join our team in the Northern Ireland. As a Shift Supervisor, you will be responsible for leading a team of Baristas to deliver exceptional customer service and achieve daily sales targets.\r\n\r\nSupervisor responsibilities:\r\n\r\nLead and motivate a team of Baristas to provide exceptional customer service\r\nEnsure the store is clean, well-stocked and meets health and safety standards\r\nManage inventory and stock levels, placing orders when necessary\r\nPrepare and serve high-quality beverages and food products\r\nHandle cash and credit card transactions accurately\r\nTrain new team members and develop existing team members\' skills\r\nJob Types: Part-time, Permanent, Apprenticeship\r\n\r\nSalary: £11.20-£11.50 per hour\r\n\r\nExpected hours: 16 – 24 per week\r\n\r\nBenefits:\r\n\r\nCasual dress\r\nCompany events\r\nCompany pension\r\nDiscounted or free food\r\nEmployee mentoring programme\r\nFlexitime\r\nReferral programme\r\nStore discount\r\nSchedule:\r\n\r\n10 hour shift\r\n8 hour shift\r\nHolidays\r\nNight shift\r\nWeekend availability\r\nSupplemental pay types:\r\n\r\nBonus scheme\r\nQuarterly bonus\r\nTips\r\nExperience:\r\n\r\nSupervising: 1 year (required)\r\nWork Location: In person', 11.50, 1, 14, '302 Airport Road West', 'Belfast', 'BT3 9EJ', '2024-03-06'),
(7, 23, 'Casual Sales Assistant', 'To continue our growth and expansion we now require truly exceptional, driven and proven Sales Assistants to join our Team\r\n\r\nKey Contribution Areas\r\n\r\nTo greet customer with a sincere and warm welcome and ensure they are aware you are there to help\r\nAsk open questions to find out customers needs\r\nTo recommend, select and locate the correct merchandise for the customers needs\r\nTo provide information about in store offers, promotions and store cards\r\nTo receive and process cash and card transactions\r\nBe aware of latest trends and remain fully updated on product knowledge\r\nMaintain a customer friendly and customer focused environment at all times.\r\nGuarantee a high level of customer service at all times.\r\nEducate and guide customers about Flannels, the brands and the product we sell.\r\nOffer alternatives and add on sales as and when necessary\r\nEnsure store standards are complete and the store is prepared for the next trading day\r\nComply with all Flannels policies and procedures at all times.\r\n\r\nQualifications\r\n\r\nSkills and Knowledge\r\n\r\nExcellent communication skills\r\nAble to work effectively within a team environment\r\nCustomer focused\r\nPersonal Qualities\r\n\r\nHigh level of personal energy to drive projects to completion\r\nConfident and assertive\r\nPositive and enthusiastic with a can do attitude\r\nPassion for fashion retail\r\nProfessional manner\r\nFashion conscious and trend aware\r\nFlexible and reliable\r\n\r\nAdditional Information\r\n\r\nThink without limits - Think fast, fearlessly, and take the team with you.\r\n\r\nOwn it and back yourself - Own the basics, own your role and own the results.\r\n\r\nBe relevant - Relevant to our people, our partners and the planet.\r\n\r\nThis role has no guaranteed hours of work, hours of work can therefore vary from week to week and, as a result, there may be weeks when no hours of work are offered.', NULL, 1, 16, '41 Victoria Square', 'Belfast', 'BT1 4QG', '2024-02-26'),
(8, 24, 'Kitchen Assistant - Part Time', 'To assist the cook in preparing all client meals.\r\n\r\nTo set tables for meals and clean the dining room.\r\n\r\nTo assist the cook in serving meals.\r\n\r\nTo follow the homes policies and procedures at all times.\r\n\r\nTo maintain good Health and safety practices and food hygiene.\r\n\r\nTo prepare refreshments as required.\r\n\r\nTo wash and dry all dishes.\r\n\r\nTo complete daily cleaning schedules\r\n\r\nTo assist the cook in prepping foods\r\n\r\nTo complete mandatory training\r\n\r\nPrevious experience within a similar role preferred.\r\n\r\nMust have good communication skills and be able to adapt to different client groups.\r\n\r\nBe able to work as part of a team.\r\n\r\nWork Remotely\r\n\r\nNo\r\nJob Types: Part-time, Permanent\r\n\r\nSalary: From £11.00 per hour\r\n\r\nExpected hours: 24 per week\r\n\r\nBenefits:\r\n\r\nOn-site parking\r\nSchedule:\r\n\r\nDay shift\r\nExperience:\r\n\r\nCatering: 1 year (preferred)\r\nKitchen experience: 1 year (preferred)\r\nFood Preparation Occupations: 1 year (preferred)\r\nWork Location: In person', 11.00, 1, 14, '23 Upper Lisburn Road', 'Belfast', 'BT10 0GW', '2024-01-24'),
(9, 25, 'Sales Associate', 'Overview:\r\nYou recognize yourself when you enter one of our stores. You love to talk about athletic sneakers and apparel as much as you love to collect them. You always scope out the latest styles, and enjoy sharing your enthusiasm with Customers. It’s easy for you to start up natural, friendly conversations, adapt to different types of Customers, and resolve issues with a smile. You like to work as part of a team as you improve your individual skills on the sales floor. Your success in this role will be measured through personal and productivity goals plus your ability to provide a great in-store experience to every Customer.\r\nQualifications:\r\n0-3 year of retail experience\r\nConfident and comfortable engaging customers to deliver an elevated experience\r\nMotivated to achieve great results because of one\'s enthusiasm from interacting with customers and athletic products\r\nInitiates completion of tasks or activities without necessary supervision\r\nFlexible availability – including nights, weekends, and holidays\r\nResponsibilities:\r\nEnsuring high levels of customer satisfaction by being knowledgeable on all products offered, and teaming up with co-workers to provide excellent sales service\r\nDelivering sales, outstanding customer experience, and operational expectations\r\nMaintaining personal and productivity goals\r\nConnects with every customer by asking open-ended questions to assess needs\r\nAbility to learn and share expertise of products and trends to fit customer’s needs\r\nMaintains an awareness of all product knowledge, and current or upcoming product / trends\r\nContributes to a positive and inclusive work environment\r\nBenefits:\r\nFrom: £6.17 – £12.92\r\n28 days holiday – plus an extra day per year for the first 5 years!\r\nAssociate discount of between 30 – 50%\r\nHapi App – offering discounts & prize draws\r\nEmployee Assistance Program – Retail Trust\r\nCompany Sick Pay scheme\r\nHead Office Internships\r\nStriper Ambassador Programme\r\nDevelopment Opportunities\r\nPlus many more.....\r\nAddress: 56, Donegall Place City: Belfast, N.Ireland Postal Code: BT1-5BB', NULL, 1, 16, '56, Donegall Place', 'Belfast', 'BT1 5BB', '2024-01-12'),
(10, 25, 'Store Manager', 'Overview:\r\nYou’re a natural teacher and coach, and have a passion for helping others deliver a great in-store Customer experience. Your team responds when you lead, and they want to work hard for you. Reporting to the District Manager, you will be accountable to lead, coach and develop all team members to provide a great in-store Customer experience, and carry out all Company strategies. Your responsibilities will include all aspects of store management, including: execution of Company standards in recruiting, hiring, training, customer service, visual merchandising and store operations. It is all these activities together that will drive sales to maximize profit goals for your store, and lead you and your team to success.\r\nQualifications:\r\nDemonstrated leadership ability with at least 2 years of experience in a customer-facing sales setting\r\nConfident and comfortable engaging customers to deliver an elevated experience\r\nMotivated to achieve great results because of one\'s enthusiasm from interacting with customers and athletic products\r\nIs resourceful and versatile in responding to changing demands and opportunities in a rapidly changing omni-channel retail environment\r\nStrong cognitive and mathematical skills, including problem analysis, decision making and financial analysis\r\nHigh level of ethics, values, integrity, and trust\r\nFlexible availability – including nights, weekends, and holidays\r\nResponsibilities:\r\nCoaching and motivating your team to inspire top performance and an exceptional customer experience\r\nExecuting standards in recruiting, hiring, training, guest services, visual merchandising, and store operations\r\nExecute plans to drive key performance indicators to maximize profitability\r\nEnhance brand loyalty by empowering team to create a natural and personable experience for customers\r\nAct as a partner between customers, sales associates, store leadership and corporate business partners\r\nMaintains a high level of customer focus and leads by example with clear and engaging communication\r\nEnsures visual directives and standards are maintained\r\nPassion for teaching associates product knowledge and how to apply their learnings to the customer experience\r\nAddress: 56, Donegall Place City: Belfast, N.Ireland Postal Code: BT1-5BB', NULL, 1, 16, '56, Donegall Place', 'Belfast', 'BT1 5BB', '2024-01-12'),
(11, 26, 'Specialised ASD Childcare Assistant', 'This role will cover our Afterschool Group Respite sessions.\r\n\r\nThese sessions run for 3 hours per session Monday - Friday with a start time of either 1.30pm / 2.45pm.\r\n\r\nSaturday sessions also available , x2 3 hour sessions, 9.45am - 4.15pm.\r\n\r\nThe successful applicant will have at least 2 years experience working with children with additional needs.\r\n\r\nThe main duties will include:\r\n\r\nproviding practical support to children at the Afterschool\'s sessions;\r\nencouraging play and participating in stimulating activities;\r\nparticipating in outings (e.g walks, trips etc) and supervising your designated child(ren) to ensure safety;\r\ndealing with severe behavioural issues and responding in a calm, pro-active way;\r\ndelivering activities as directed by the Afterschool supervisor and inclusive of the views of participating children or young people with additional needs;\r\nability to take initiative and pro-actively support children especially during meltdowns;\r\nsupport the supervisor in all club-related duties, and taking direction from club supervisor;\r\ntoileting and feeding duties (please ensure you are comfortable with this before applying);\r\nacting as bus escort on-board the charity’s minibus on occasional day trips / summer scheme;\r\ngiving children the freedom to spend their leisure time in a flexible and safe way;\r\nencouraging fair and caring behaviour among the children;\r\nencouraging independence and self-esteem;\r\ndealing with injuries and emergencies in line with Sólás policies;\r\ntaking instruction from supervisor;\r\nclear up at end of sessions;\r\nliaising with parents, carers and sometimes other professionals;\r\nresponding to parent enquiries by phone or email, where relevant;\r\nattending weekly team meetings and reporting on activities, where appropriate;\r\nkeeping records as required by the Belfast HSCT;\r\nensuring adherence to Sólás policies and procedures;\r\nbeing flexible to help wherever needed, including covering staff absences if asked;\r\nworking as part of a team within Sólás for the advancement of the charity.\r\nThe above list is not restrictive and staff are expected to have a flexible approach in regards to their duties.\r\n\r\nJob Type: Part-time\r\n\r\nSalary: £10.50 per hour\r\n\r\nBenefits:\r\n\r\nOn-site parking\r\nExperience:\r\n\r\nChildcare ASD: 2 years (required)\r\nWork Location: In person\r\n\r\nApplication deadline: 17/02/2024', 10.50, 1, 17, '284a Ormeau Rd', 'Belfast', 'BT7 2GB', '2023-12-27'),
(12, 26, 'Respite Support Worker', 'We require Respite Support Workers weekday afternoons (6 - 18 hours per week) for the care and socialisation of children with autism and learning difficulties.\r\n\r\nRespite work on a 1-1 or 2-1 basis may be carried out later in the evening, eg- 4pm - 7pm. Applicants must have a clean driving licence and be over 25 to avail of Sólás vehicles to complete respite work.\r\n\r\nSuccessful applicants must have at least 1 years experience supporting children with ASD / addition needs and a minimum of Level 3 in childcare related subject.\r\n\r\nYou could work either indoors or outside, depending on location and the type of activity. Applicants should have previous experience working with children with additional needs. Your work will usually be very active, and will require an understanding of autism and knowledge of supporting young people with special needs. You may be required to do bus escort for pickups and attend team meetings. All Sólás staff must have a ‘can do’ attitude, be enthusiastic and flexible, and commit to ensuring that all children and young people in our care enjoy a safe and enjoyable experience.\r\n\r\nRespite Support Worker: Varying shifts available through the week.\r\n\r\nAny questions or queries please contact Mari Therese on 028 9024 7600.\r\n\r\nPlease forward CVs to recruitment@solasbt7.com to apply.\r\n\r\nJob Type: Part-time\r\n\r\nSalary: £12.00 per hour\r\n\r\nExpected hours: 3 – 15 per week\r\n\r\nBenefits:\r\n\r\nOn-site parking\r\nExperience:\r\n\r\nChildcare ASD: 2 years (required)\r\nLicence/Certification:\r\n\r\nDrivers Licence (required)\r\nWork Location: In person\r\n\r\nApplication deadline: 17/02/2024', 12.00, 1, 17, '284a Ormeau Rd', 'Belfast', 'BT7 2GB', '2023-12-27'),
(13, 27, 'Care Assistant', 'JOIN OUR AWARD WINNING TEAM THIS YEAR!\r\n\r\nEMPLOYER OF THE YEAR WINNER 2022 and 2023\r\n\r\nUK NO.1 THREE TIME WINNER\r\n\r\nWe are excited that you are interested in being a ‘Caremark Care Assistant!’\r\n\r\nDo you want to make a difference in your local community and take the next step in your career?\r\n\r\nIf \'YES\' to the above, our wonderful team at Caremark NI would love to hear from you!\r\n\r\nWe have recently been awarded ‘Employer of the Year!’ for the second year in a row.\r\n\r\nAt Caremark NI we value all our Staff and are dedicated to their Wellbeing and have also recently been awarded for ‘Wellbeing in the Workplace’!\r\n\r\nOur friendly team is growing and we would love you to be part of it!\r\n\r\nWe want people who are looking for a rewarding role and have a caring nature.\r\n\r\nEach day brings a sense of purpose while helping many elderly and vulnerable people in the community. You will have incredible job satisfaction!\r\n\r\nWhat you\'ll be doing!\r\n\r\nMeal Prep\r\nCompanionship Care\r\nPersonal Care\r\nAssist with Medication\r\nKeep accurate records\r\nCommunicate clearly with your team members\r\nOffer an outstanding service that is safe, caring, responsive and effective\r\nTo achieve this, full training is provided in all aspects of care, meaning that no previous experience in care is necessary.\r\n\r\nWe understand the importance of being a ‘Caremark Care Assistant’ and always do our best to compensate you and make you feel valued!\r\n\r\nWe retain our staff and have been voted ‘The Number 1 Caremark 3 Years in a Row!’ You are in good hands!\r\n\r\nSome of our benefits include:\r\n\r\nFlexible Schedules\r\nMentoring Peer Support\r\nFree Onsite Mental Health & Wellbeing Support\r\nOngoing Training\r\nIn-house Promotion Opportunities\r\nFree Staff and Families Appreciation Days\r\nStaff Award and Recognition Program\r\nRefer a Friend Program\r\nFour-week pro rata annual leave entitlement\r\nPaid calls while client in hospital/respite\r\nAll we need from you is a full UK driving license with access to your own car and of course the desire to care for others.\r\n\r\nCaremark NI are recruiting those considering care for the first time as well as carers with experience. We also would love to hear from candidates who want a career change from other sectors such as retail and hospitality! We have full-time and part-time roles with a range of hours to suit.\r\n\r\nThis role is based in Northern Ireland.\r\n\r\n(Please note-we do not offer sponsorship).\r\n\r\nJob Types: Full-time, Part-time, Permanent\r\n\r\nSalary: £10.85-£12.00 per hour\r\n\r\nBenefits:\r\n\r\nCompany events\r\nHealth & wellbeing programme\r\nReferral programme\r\nSchedule:\r\n\r\nMonday to Friday\r\nWeekend availability\r\nApplication question(s):\r\n\r\nDo you live in Northern Ireland? (required)\r\nLicence/Certification:\r\n\r\nUK Driving Licence and Access to your own car (required)\r\nWork authorisation:\r\n\r\nUnited Kingdom (required)\r\nWork Location: On the road', 11.57, 1, 17, '3 Balloo Place', 'Bangor', 'BT19 7BP', '2024-02-28'),
(14, 28, 'Front of House Receptionist', 'Tara Lodge, the No. 1 place to stay in Belfast, is seeking a Front of House Receptionist (full-time or part-time considered).\r\n\r\nIf you believe in delivering unique customer experiences and are seeking to join a well-established business where there is a genuine opportunity to influence and support the future development of the company, then this is the ideal role for you. Energetic and self-motivating, suitable candidates for this position will have a passion for excellent customer service.\r\n\r\nAs a company, we endeavour to provide excellent training to the whole team as we understand that the people we employ are those that make the experience unique for our guests. Experience is not essential as full training will be provided.\r\n\r\nEmployee Duties:\r\n\r\nProvide a friendly welcome to each guest\r\nAnswer reservation enquiries promptly via email and telephone\r\nProvide excellent customer service to guests at every interaction\r\nProvide tourist information for guests and book tours/tickets where possible\r\nEffective communication with Housekeeping and Kitchen departments to ensure smooth running of daily operations\r\nReservation admin\r\nEssential Criteria:\r\n\r\nGood level of secondary education\r\nExcellent time management and organisational skills\r\nGood interpersonal and communication skills\r\nFlexibility for Evening & Weekend work\r\nShift Pattern:\r\n\r\n8am - 4pm or 4pm-Midnight\r\nThere is an option for evening only shifts if suited to the candidate\'s other commitments\r\nJob Types: Full-time, Part-time, Permanent\r\n\r\nSalary: £11.00 per hour\r\n\r\nBenefits:\r\n\r\nCompany events\r\nCompany pension\r\nFree parking\r\nOn-site parking\r\nSchedule:\r\n\r\n8 hour shift\r\nWork authorisation:\r\n\r\nUnited Kingdom (required)\r\nWork Location: In person', 11.00, 1, 17, '36 Cromwell Road', 'Belfast', 'BT7 1JW', '2024-03-02'),
(15, 28, 'Breakfast Cook', 'As the Breakfast Cook at Tara Lodge you will be assisting the Head Breakfast Chef, taking responsibility for the preparation of breakfast which will be freshly cooked for each guest and be of only the highest standard; Breakfast is the most important meal of the day after all!\r\n\r\nThe successful candidate may not have lots of experience but will;\r\n\r\nHave exceptional culinary service standards\r\nHave outstanding attention to detail whilst working in a fast-paced environment\r\nHave the ability to work closely as part of a dedicated and passionate team\r\nBe able to multi task effectively\r\nBe responsible for stock control and ordering of food\r\nBe flexible to work closely with other staff departments to ensure the best possible service for guests\r\nYour key responsibilities will include all aspects of assisting a busy breakfast service whilst maintaining high standard in taste and presentation. You will ensure the smooth running of breakfast preparation and exceed expectations to ensure that breakfast will be a highlight in any guest’s stay.\r\n\r\nThis role is open to those with a passion for cooking, you do not need to be qualified, you just need to enjoy cooking and work well as part of a team. Flexibility is a must to facilitate weekday & weekend hours, working early shifts.\r\n\r\nWorking pattern is 4 days per week over a 7 day period;\r\n\r\nMonday - Friday 7am - 11am\r\n\r\nSaturday & Sunday 8am - 11.30am\r\n\r\nJob Types: Part-time, Permanent\r\n\r\nSalary: £11.00 per hour\r\n\r\nBenefits:\r\n\r\nCompany pension\r\nOn-site parking\r\nWork authorisation:\r\n\r\nUnited Kingdom (required)\r\nWork Location: In person', 11.00, 1, 14, '36 Cromwell Road', 'Belfast', 'BT7 1JW', '2024-03-02'),
(16, 9, 'Retail Store Manager', 'Retail Store Manager\r\n\r\nJob Req ID: 29320\r\nPosting Date: 1 Mar 2024\r\nFunction: EE Retail\r\nUnit: Consumer\r\nLocation: Newry (R270), Newry (N.I), United Kingdom\r\nSalary: From £27,000 up to £34,100 plus commission\r\nSalary - Base salary starting from £27,000 up to £34,100 plus commission\r\n\r\n\r\nTime to step up.\r\n\r\n\r\nAs an EE Store Manager, you’ll make the big decisions and the little ones, share your knowledge and learn a thing or two as well, so that anyone who’s anyone wants to work in or visit our store. You’ll look after our people and products to make sure we continue to create a retail experience nobody can beat. And by designing an environment that’s warm and welcoming, you’ll help your people to excel and your customers to enjoy every minute they spend with us. Overseeing one of our stores, you’ll get downright chills about the opportunities the wonderful world of retail can offer you.\r\n\r\n\r\nWhat you’ll do:\r\n\r\n\r\nIdentify and harness new retail opportunities\r\nLead, engage and develop your talented and knowledgeable team of people\r\nEstablish a culture of high-performance that focuses on both fiscal and behavioural KPIs\r\nCreate and manage a relaxed, welcoming, customer-focussed environment\r\nCollaborate with our Regional Managers to create long-term succession strategies\r\nYou’ll definitely:\r\n\r\n\r\nHave a track record of inspirational leadership in a large/high-profile store\r\nDemonstrate a history of leading large teams to strong commercial results\r\nBe self-motivated and proactive\r\nHave established coaching and development skills\r\n\r\nYou might even:\r\n\r\n\r\nPossess an ability to set and carry out long-term plans\r\nDemonstrate mobility within a local area\r\nWhat’s in it for you?\r\n\r\nExceptional career progression in Retail and to other areas of BT with our Aspire internal development programme\r\nThe opportunity to significantly increase your earnings through commission, rewards and incentives\r\nOptional Private Healthcare, Critical Illness and Dental cover\r\nOptional Pension and Shares scheme to protect your future\r\nHuge discounts off EE & BT products including your Mobile and Broadband – saving you hundreds of pounds every year\r\n25 days’ holiday (pro-rata) with the opportunity to buy more, plus flexi bank holidays\r\nVolunteering days, so you can give back to your local community\r\nGym membership discounts and many more savings on attractions for the family all year round\r\nAbout EE\r\n\r\n\r\nEmpowered, challenged, supported and rewarded, our people are the key to our success. Our people keep customers happy with great service, and our network, named best in the UK, is keeping their digital lives connected. Since becoming part of the BT family, we’ve focused on creating an energising culture that makes EE an even better place to build a career. We’re at the top of our game, and this is your chance to join us.\r\n\r\n\r\nAt EE, we’re creating an inclusive working environment where people from all backgrounds can succeed. Diversity makes sense for us, for our customers and for our future. We value different perspectives, skills and experiences, and welcome applications from all sections of the community.\r\n\r\nWe’re therefore open to considering flexible working, things like part-time hours or other flexible options. We also offer emergency time off for dependants in addition to generous maternity and paternity leave. It’s our way of helping people find a job that suits them, so talk to us during the recruitment process to find out where you could fit in.\r\n\r\nIf you’re thinking about working for the UK’s biggest and fastest network, why not follow our recruitment channels on Twitter, LinkedIn and Glassdoor. Packed with the latest jobs, company news and career stories, it could be a great move.', NULL, 1, 16, 'Unit 25A, Buttercrane Shopping Centre', 'Newry', 'BT35 8HJ', '2024-01-14'),
(17, 9, 'Customer Service Advisor', 'Customer Service Advisor\r\n\r\nJob Req ID: 26974\r\nPosting Date: 29 Feb 2024\r\nFunction: EE Contact Centres\r\nUnit: Consumer\r\nLocation: Riverside Tower, Belfast (N.I), United Kingdom\r\nSalary: £12.05 per hour\r\nWhere: Belfast\r\nPart time: 20, 25 and 30 hours weekly available\r\nSalary: £12.05 per hour\r\nAre you someone that has a wealth of life experience which could help you navigate challenging situations? This could be resilience from raising a family, or the life skills you’ve built up from years of building relationships with those around you. If so, you have the transferrable skills to succeed in a Customer Service Billing role with EE.\r\n\r\nWhy not use your skills to make a difference and join our Billing Team in {location}? We need people like you to speak with our customers over the phone about their account, listen to their needs and work together to find the best possible outcome.\r\n\r\nWe understand that life never stands still, and like most roles within EE, this opportunity is designed with flexibility in mind. We’re here to support you in being successful, meaning we’ll do everything we can to make sure you don’t miss that appointment, or can look after your family in an emergency. Just a few ways we’re doing this include giving you the opportunity to schedule your own breaks and banking time, and the option of occasional home working.\r\n\r\nWhat’s in it for you?\r\n\r\nA great hourly rate of 12.05, plus incentives and bonuses\r\nHuge discounts of EE and BT products including your Mobile and Broadband, saving you hundreds of pounds every year.\r\nSupport in carving your own career path. We are passionate about developing our people and we’ll support you to achieve the career you want.\r\nSeason Ticket Travel Loan, giving you the funds to pay for your travel to and from work up front, making a difference where it counts.\r\nVolunteering days, so you can give back to your local community.\r\nOptional Private Healthcare and Dental, to protect you and your family.\r\n\r\nOn top of all that, we’ve got a great team culture, meaningful support and tailored training to help you build a lasting career. What are you waiting for?', 12.05, 1, 16, 'Unit 25A, Buttercrane Shopping Centre', 'Newry', 'BT35 8HJ', '2024-01-14'),
(18, 15, 'Senior Pre-Sales Consultant', 'Deal Strategy\r\n\r\nSupporting deal plans and deal qualification.\r\nWorking with the sales principal, account principals and other teams and stakeholders involved in shaping deals to prepare robust (i.e., client-centred, proposition aligned, Classification: Controlled and pain point/benefit-led) deal strategies for new business, renewal, and upsell opportunities.\r\nWorking with the sales lead and account principals to structure new business, renewal, and upsell opportunities, accelerating, where possible, the client’s buying journey.\r\nFacilitating the governance of new opportunities entering the pipeline to enable consistent deal qualification, ensuring the sales team focuses its time and effort on the right opportunities and recommending course-correcting actions where required.\r\nGenerating performance reports, identifying insights and trends quarterly, including tracking buyer behaviours and trends. Bids, Presentations, and Proposals\r\nWriting high-quality, compelling bid and proposal content that differentiates Version 1 and articulates what and how we deliver core services and offerings, in the context of the client’s pain points and requirements.\r\nCreating bid and proposal documentation that adheres to Version 1 guidelines and designing new templates to improve bid and proposal content.\r\nReviewing offering materials and assessing how key messages can be positioned in sales collateral and bid and proposal content.\r\nIncorporating key messaging (approach, pains, gains etc.) for Version 1 offerings into bid and proposal content.\r\nSupport identification of new business opportunities, both with new and existing clients.\r\nCompleting market scrutiny across our sector and within both new and existing clients.\r\nActing as the bridge between the sales, delivery, and the Office of the CTO team, analysing, synthesizing, and presenting client feedback.\r\nWorking with the marketing and bid enablement team to gain insight from delivery teams, unearthing useful anecdotes\r\n\r\nQualifications\r\n\r\nDesired Skills / Knowledge:\r\n\r\nUnderstanding of client buyer journeys and procurement frameworks for clients in Version 1’s target sectors, including Government, Financial, Insurance, and Capital Markets\r\nStrong understanding of the Private Sector and/or Capital Markets\r\nDetailed oriented with strong written and verbal communication skills.\r\nExperience of creating proposals that can be adapted and tailored to a client organizations specific needs and challenges.\r\nDesign experience to create client presentations that are visually appealing and in line with brand guidelines.\r\nAbility to work collaboratively across different internal departments and with engineers working in the field to capture insight for content and for bids and proposals.\r\nSales governance expertise with experience in qualifying deals and driving deal conversion.\r\nCritical thinking and ability to challenge stakeholders.\r\n\r\nAdditional Information\r\n\r\nAt Version 1, we believe in providing our employees with a comprehensive benefits package that prioritises their well-being, professional growth, and financial stability.\r\n\r\nOne of our standout advantages is the ability to work with a remote schedule along with business travel, allowing our employees to strike a balance between work and life. We also offer a range of tech-related benefits, including an innovative Tech Scheme to help keep our team members up-to-date with the latest technology.\r\n\r\nWe prioritise the health and safety of our employees, providing private medical and life insurance coverage, as well as free eye tests and contributions towards glasses. Our team members can also stay ahead of the curve with incentivized certifications and accreditations, including AWS, Microsoft, Oracle, and Red Hat.\r\n\r\nOur employee-designed Profit Share scheme divides a portion of our company\'s profits each quarter amongst employees. We are dedicated to helping our employees reach their full potential, offering Pathways Career Development Quarterly, a programme designed to support professional growth.', NULL, 1, 8, '8 Lanyon Place', 'Belfast', 'BT1 3LP', '2024-01-02'),
(19, 3, 'Software Engineer I', 'As a Software Engineer I you’ll get the opportunity to be a hands-on engineer, learning best practice engineering processes and approaches whilst receiving ongoing development through coaching, mentoring and pairing with other engineers on your team. From problem-solving to challenging old ways of thinking, you will have the opportunity to unleash your full potential and creativity whilst working with cutting edge technologies in a dynamic and collaborative team.\n\nAbout the Team\n\nThe Data Platform team is responsible for building ETL Pipelines that fuel the Data Platform at Rapid7. Moving both Product Usage and Product Data into our Data Platform to enable Product Analytics at Rapid7 and for product teams to develop new features, enhance existing features and build shared experiences to create value for customers across the world.\n\n\nWe have a cutting edge data stack including Kafka, K8s, Spark and Iceberg.\n\nAbout the Role\nThe Software Engineer I is a part of our Data Platform Engineering. In this role you will be focussed on helping our product teams move data into our Data Platform for in product experiences and product analytics. You will be given the time to learn and develop your skills surrounded by a team of incredibly smart and experienced Engineers.\n\nIn this role, you will:\n\nBuild and Maintain Reliable Data Pipelines\n\nParticipate in the design and planning of upcoming work, our Engineers are first class stakeholders in all parts of the development process\n\nAbility to work cross functionally to help deliver a shared Data Platform\n\nWork with Practice specific technologies\n\nThe skills you’ll bring include:\n\n1-2 years experience in software development using Python or other equivalent programming languages\n\nExcited by technology, curious and eager to learn\n\nKnowledge of some tooling from within the Data Space e.g. (Spark, Kafka, Airflow, Jenkins)\n\nThe attitude and ability to thrive in a high-growth, evolving environment\n\nCollaborative team player who has the ability to partner with others and drive toward solutions\n\nStrong creative problem solving skills\n\nSolid communicator with excellent written and verbal communications skills both within the team and cross functionally\n\nPassionate about delighting customers, puts the customer needs at the forefront of all decision making\n\nExcellent attention to detail\n\n\nWe know that the best ideas and solutions come from multi-dimensional teams. That’s because these teams reflect a variety of backgrounds and professional experiences. If you are excited about this role and feel your experience can make an impact, please don’t be shy - apply today.', NULL, 1, 1, '19 Chichester Street', 'Belfast', 'BT1 4JB', '2024-01-15');
INSERT INTO `JobListings` (`ListingID`, `CompanyID`, `Title`, `Description`, `Salary`, `ContractTypeID`, `SectorID`, `StreetAddress`, `City`, `PostCode`, `PostDate`) VALUES
(20, 3, 'Software Engineer II - Java', 'As a Software Engineer II, you will take ownership of the development of new features for your team, working with cutting edge technologies and owning this process end to end. You will bring a customer centric approach with a curiosity and passion for continuous learning. You will be provided with coaching and support to help you further develop your skills to reach your full potential.\n\nAbout the Team\n\nOur Product and Engineering team works with our award-winning products to help us create a single experience to help customers assess risk, detect threats and automate their security programs at over 10,000 organizations. These teams use best-in-class technology, leading-edge research, and broad, strategic expertise to develop new products and features, and enhance existing features, in order to create value for customers across the world.\n\nThe stakes for creating a safer digital world are greater than ever. At Rapid7 we believe it’s our responsibility to show up every day and give our best for our customers and the entire security community. Our global engineering teams are at the centre of this mission and are dedicated to building a complete suite of industry-leading products which provide a cohesive platform for our customers. Our range of solutions spans vulnerability management, detection, automation, cloud security, and penetration testing; in order to build these products our teams work with an array of technologies including Java, Python, AWS and Go, just to name a few.\n\nJoin our engineering team to help us build and innovate great products on our Insight platform using the latest technologies to make the world a safer digital space.\n\nAbout the Role\n\nThe Software Engineer II is a part of our Product and Engineering team who are at the forefront of keeping our customers safe from attacks and breaches. In this role you will be focussed on helping our customers seamlessly manage their security solutions as effectively and efficiently as possible, and ensuring our products are delivering a secure experience. You will be given the time to continue to develop your skills surrounded by a team of incredibly smart and experienced Engineers.\n\nIn this role, you will:\n\nBuild, maintain, and release our well architected services by writing correct and clean code consistently and following best practices and conventions\n\nParticipate in the design and planning of upcoming features, our Engineers are first class stakeholders in all parts of the development process\n\nWhen required, partner with internal teams such as UX and Product Management who work deeply with our product to ensure we are understanding our customers needs\n\nWork towards developing a deep understand of our products in order to best support our customers\n\nWork with Practice specific technologies\n\nThe skills you’ll bring include:\n\nA minimum of 2 years experience in software development using Java, Spring or other equivalent programming languages\n\nExcited by technology, curious and eager to learn\n\nThe attitude and ability to thrive in a high-growth, evolving environment\n\nCollaborative team player who has the ability to partner with others and drive toward solutions\n\nStrong creative problem solving skills\n\nSolid communicator with excellent written and verbal communications skills both within the team and cross functionally\n\nPassionate about delighting customers, puts the customer needs at the forefront of all decision making\n\nExcellent attention to detail\n\nWe know that the best ideas and solutions come from multi-dimensional teams. That’s because these teams reflect a variety of backgrounds and professional experiences. If you are excited about this role and feel your experience can make an impact, please don’t be shy - apply today.', NULL, 1, 1, '19 Chichester Street', 'Belfast', 'BT1 4JB', '2024-01-15'),
(21, 11, 'Deli Assistant', 'We offer:\r\n\r\nUp to £11.50 per hour\r\nFlexible and sociable working hours\r\nGenerous discount scheme on completion of probation period.\r\nOpportunities for career progression in an award winning and growing company.\r\nModern and attractive working environment.\r\nIs this what you\'re looking for?\r\n\r\nWhile previous food service experience may be an advantage, enthusiasm and willingness to learn is much more important to us.\r\n\r\nPlease note that due to a high number of applications that we generally receive, it is not always possible to reply to all applicants.\r\n\r\nJob Types: Full-time, Part-time, Permanent\r\n\r\nSalary: Up to £11.50 per hour\r\n\r\nBenefits:\r\n\r\nEmployee discount\r\nStore discount\r\nSchedule:\r\n\r\n8 hour shift\r\nMonday to Friday\r\nWeekend availability\r\nApplication question(s):\r\n\r\nAre you looking Full Time or Part Time Work?\r\nExperience:\r\n\r\nCustomer Service: 2 years (required)\r\nFood handling: 1 year (required)\r\nWork Location: In person', 11.50, 2, 14, '87-89 Upper Lisburn Road', 'Belfast', 'BT10 0GY', '2024-03-06'),
(22, 2, 'Floor Staff', 'Sweet Afton are looking for floor staff to join our ever growing teams.\r\n\r\nPreferred criteria for these positions are as follows:\r\n\r\nBar/ floor experience in a busy bar/ restaurant\r\nExcellent level of customer service\r\nCash handling experience\r\nAbility to work as part of a team\r\nExcellent communication skills\r\nAbility to work under pressure\r\nThe ideal candidate will be fully flexible to work, days evenings and weekend shifts. Must be available to work Saturday days and nights\r\n\r\nJob Types: Full-time, Part-time\r\n\r\nSalary: £7.49-£10.42 per hour\r\n\r\nDay range:\r\n\r\nEvery weekend\r\nHolidays\r\nMonday to Friday\r\nWeekend availability\r\nShift:\r\n\r\n10 hour shift\r\n12 hour shift\r\n8 hour shift\r\nDay shift\r\nNight shift\r\nWork Location: In person', NULL, 1, 17, '12 Brunswick Street', 'Belfast', 'BT2 7GG', '2024-02-27'),
(23, 8, 'Warehouse Operative - Nights', 'Position: Warehouse Operative\r\nContract Type: Permanent - 40 hours\r\nLocation: Belfast\r\nShift: Nights Monday-Saturday (rest day in between will change each week)\r\n23:00-08:00\r\n\r\nHourly rate: £10.90 - £11.40\r\n\r\nWhy choose DHL eCommerce?\r\n\r\nWant to work for one of the UK’s best workplaces? We are proud to announce that DHL eCommerce UK has been recognised as a Best Workplace 2023 and achieved Top Employer accreditation for the 3rd year running. As well as competitive pay rates, you will be entitled to a range of benefits including discount vouchers for restaurants, cinemas, retail outlets, healthcare and much more as well as pension, enhanced family leave, childcare discounts, employee assistance programme and much more!\r\n\r\nAbout the role\r\n\r\nTo join us as a Warehouse Operative, you won’t need experience - we’ll provide you with that. But you will need a strong work ethic and attention to detail. It’s a physical job, in a busy warehouse that’s always working at full speed, so you’ll be on the go throughout your shift. Whatever task you’re performing, your attention to detail will make sure every parcel gets to its customer right on time.\r\n\r\nThe ideal candidate will have:\r\n\r\nA flexible in approach to work & work effectively as part of a team, providing support in resolving problems and have a can do, right first time and passionate approach\r\n\r\nWhat about career development?\r\n\r\nWe take every employee’s career seriously and believe in realising their full potential. We have dedicated learning and development programmes that are open to every employee and an open working culture where everyone’s voice is heard, so you can shape your future career path at DHL eCommerce.\r\n\r\nWhat will you need to do next?\r\n\r\nIf you meet the requirements for this role and are looking for your next career move, submit your application to us along with an up-to-date CV\r\n\r\nOur approach to Diversity and Inclusion\r\n\r\nAs a global company, we see the diversity of our employees as a genuine strength. A strength that we will only really leverage if we ensure that our employees sincerely feel that they can bring their true selves to work every day.\r\n\r\nWe’re committed to attracting the best possible person for every vacancy irrespective of age, gender, ethnicity, disability, sexual orientation, gender identity, socio-economic background, religion and/or belief. We will ensure that all our resourcing activities are fair, transparent, and consistent across the UK.', 10.90, 1, 13, 'Edgewater Business Park, Harbour, Edgewater Road', 'Belfast', 'BT3 9JQ', '2023-12-19'),
(24, 16, 'Trainee Transport Planner', 'Brook Street Recruitment is working with our client in Larne to recruit a full time and permanent Trainee Transport Planner\n\nThe candidate hired will then be responsible for consolidating a variety of loads in the most efficient way possible and managing drivers in order to achieve all targets.\n\nDuties\n\nLiaise with all drivers and warehouse staff to ensure an efficient work environment.\nReport to Transport Manager Team member in the event of product recall or withdrawal and incident management occurrences Maintain vehicle operating standards.\nEnsure product safety, integrity and quality is not affected during storage and transport.\nOversee planning of loads to ROI & NI Creates manifests to ensure load consolidation.\nLiaise with Transport planners in our depot in England.\nComplete appropriate checks and paperwork for goods received.\nDeal with staff and customer queries\nOrganising of loads for next day deliveries\nArrange good`s in and out bookings.\nObserve all aspects of health and safety regulations and training requirements.\nMake the Transport Manager aware of any issues that may arise.\nOperates at all times in line with company policies and procedures.\nOperation of forklift machinery to fulfil load preparation\nAssist the team with loading and unloading delivery vehicles if required.\nAny other duties as and when required.\n\nCriteria\nStrong administration skills\n\nStrong communication skills\nGood problem-solving skills, good attention to detail and an ability to thrive under pressure.\n\nComputer literacy is essential to this position\nHours or work are Monday to Friday 6am to 4pm\n\nSalary will depend on background and performance at interview - entry level circa £24-25k per year\n\nPlease send CV to Colleen Farquharson via the apply link\n\nBrook Street are proud to support the Armed Forces Covenant and as such, we guarantee to interview all candidates who are veterans or spouses/partners of military personnel, and who meet all the essential criteria for the vacancy.\n\nAs a Disability Confident Leader, and holder of the Gold Award status from the Defence Employer Recognition Scheme, Brook Street, as a supplier to the Public Sector Resourcing Framework (PSR), will offer you a guaranteed interview with a PSR Sourcer.\n\nShould you identify as a candidate with a disability and/or as a veteran or spouse/partner of military personnel and meet all the essential criteria for the role, we encourage you to reach out to us via the Brook Street website. Here you will find a link to register your interest and state the role that you are interested in. We are committed to engaging with you.\n\nIn cases where we have a high volume of ex-military candidates/military spouses/partners, who meet all of the essential criteria, Brook Street will interview the best candidates from within that group.', NULL, 1, 13, '94 Victoria Street', 'Belfast', 'BT1 3GN', '2024-02-18'),
(25, 14, 'Temporary Green Keeper', 'Ballyclare Golf Club is a well-established 18-hole parkland golf course which has just celebrated its centenary in 2023. The complex also includes a driving range and practice chipping area.\r\n\r\nWe wish to appoint a temporary Green Keeper,\r\n\r\nThis is an exciting opportunity,\r\n\r\n· For a developing green keeper.\r\n\r\n· Someone looking a career change.\r\n\r\n· A young person wishing to start an apprenticeship.\r\n\r\nWorking with an established golf course management company and our experienced Head Green keeper.\r\n\r\nOngoing training will be provided to help further your ambition within this industry.\r\n\r\nAppropriate technical skills and qualifications would be an advantage through ongoing training to gain spraying qualifications in PA1 - PA2 & PA6 will be provided.\r\n\r\nGreen Keeper\r\n\r\nKey responsibilities\r\n\r\n· Use Golf course machinery for maintenance of the golf course in a safe manor.\r\n\r\n· Communicates clearly with the Head Green Keeper and other members of staff to discuss activities, goals and highlight any concerns or issues.\r\n\r\n· Completes pesticide and fertiliser applications and/or operates and calibrates pesticide and fertiliser application equipment in conjunction with the Head Green Keeper, (when qualified).\r\n\r\n· Participates in the operation and maintenance of irrigation pumps and in the maintenance of irrigation and drainage systems.\r\n\r\n· Participates in the tree management program including the appropriate use of chainsaws\r\n\r\n· Supports the Head Green Keeper in the delivery of the agronomic plan.\r\n\r\n· Ensures the guidelines set out for standards and presentation are adhered to.\r\n\r\nPay and conditions:\r\n\r\nThe Club will offer to the right candidate an excellent remuneration package depending on experience along with 28 days annual leave and a bonus paid twice a year. On-going training will also be provided by Carr Golf to ensure the highest of standards are achieved in the presentation of the course.\r\n\r\nIf you would like to be part of the team at Ballyclare Golf Club, then email your CV and a short application note stating why you are attracted to the position to nealem8@gmail.com\r\n\r\nClosing Date: 31st March 2024\r\n\r\nJob Type: Temporary\r\n\r\nLicence/Certification:\r\n\r\nDriving Licence (preferred)\r\nWork Location: In person\r\n\r\nApplication deadline: 31/03/2024', 11.00, 2, 13, '25 Springvale Road', 'Ballyclare', 'BT39 9JW', '2024-03-07'),
(26, 12, 'Coffee Shop Assistant', 'We currently have a fantastic opportunity for a part time Coffee Shop Assistant working in our coffee shop. This role does include some weekend working, however does not include late evenings.\r\n\r\nResponsibilities\r\n\r\nThe duties for this role will include, serving customers in a polite and friendly manner, basic food preparation, ensuring kitchen, service and restaurant areas are kept clean, tidy and safe. Other duties will include cash handling and taking an active part in any unit sales promotions.\r\n\r\nIdeal Candidate\r\n\r\nPolite and friendly\r\nNeat and tidy in appearance\r\nAwareness of Food Hygiene and Health & Safety standards\r\nGood command of the English Language\r\nA \'can do\' attitude, prepared to help out the rest of the team in a willing and positive manner\r\nIn return we offer\r\n\r\nPension Scheme.\r\nFree parking and discounted meals when on duty dependent on shift pattern.\r\nTraining and development opportunities.\r\nUniform provided.\r\nStaff Discount.\r\nStaff online savings portal.', 10.52, 1, 14, '5 Boucher Road', 'Belfast', 'BT12 6HR', '2024-01-31'),
(27, 12, 'Cleaning Assistant', 'As a result of our expansion plans and our continued ongoing success we are looking to appoint a part time Cleaning Assistant.\r\n\r\nWhat are we looking for?\r\n\r\nTo be successful in this role you will have an eye for detail and a dedications to achieve high standards of cleanliness.\r\n\r\nAn exciting opportunity has become available to join The Range. Duties will include sanitary cleaning, floor polishing, vacuuming and dusting.\r\n\r\nPrevious cleaning experience is NOT essential. We have the all the necessary support and training to get you up to speed and delivering excellent service.\r\n\r\nWhy The Range?\r\n\r\nWorking for The Range is no ordinary job. We are a Sunday Times Top Track 100 company and one of the UK’s fastest growing retailers.\r\n\r\nMuch of this success is thanks to our talented and passionate teams. From retail opportunities nationwide to innovative roles in our Head Office and fulfilment positions at our state of the art distribution centres, you’re sure to find the role to match your skills and your ambition.\r\n\r\nPeople are at the heart of our retail concept, and we want to invest in our staff and make the future extraordinary. Apply today for a challenging and rewarding position in a dynamic, fast paced environment and take the next step in your career.', 11.78, 1, 13, '1 Buncrana Road', 'Derry/Londonderry', 'BT48 8QN', '2024-02-04'),
(28, 17, 'Online Assistant', 'Location\r\nStrand Road Londonderry Store, Sainsbury\'s Supermarkets Ltd 150 Strand Road, Londonderry, BT48 7TL\r\nHours\r\nPart-time\r\nContract-Type\r\nFixed-Term Assignment\r\nRate\r\n£12.00 per hour\r\nAreas of business\r\nRetail\r\nJob ID\r\n226108\r\nSchedule\r\nSun 7am - Sun 11am\r\n\r\nMon 5am - Mon 9am\r\n\r\nTue 5am - Tue 9am\r\n\r\nTotal hours: 12\r\n\r\nEarly Shift: 5am - 9am\r\n\r\nJob Description\r\nLove food, shopping and fast-paced work? Joining our team as an Online Assistant could be the role for you! This is a hands-on job that makes our online customer orders happen, from the second they click the order button on our website to the moment their shopping lands on their doorstep.\r\n\r\nAs an Online Assistant you could be on the shop floor picking our customers’ orders, taking real care to select the best quality products and making every effort to give them exactly what they have asked for. Or you could be working in our online warehouse, supporting with customer queries, processing orders through the tills and even working with our online Drivers to load their vans so they’re ready to hit the road on-time.\r\n\r\nWhichever area you’re working in, you’ll take pride in doing the right thing for our customers and have a keen attention to detail. It’s important you are also comfortable working with new technology and being active, including lifting and moving shopping containers up to 15kg.\r\n\r\nWe aim to make everyone who joins us be the best they can be and are committed to being a fully inclusive retailer where our customers love to shop, and our colleagues love to work!\r\n\r\nIf the shifts for this role cover hours earlier than 6am or later than 11pm, you will need to be at least 18 years of age.\r\n\r\nSainsbury\'s will only recruit individuals who have passed the school leaver’s age. To find out the school leavers age for your country please visit: https://www.gov.uk/know-when-you-can-leave-school\r\n\r\nAlongside a market leading rate of pay, we also offer a great range of benefits for all our colleagues:\r\n\r\nNightshift premium - in addition to the advertised hourly rate, a further £2.45 nightshift premium is paid for every hour worked between midnight - 5am (where applicable).\r\n\r\nDiscount card – 10% discount off on your shopping at Sainsbury’s, Argos, Tu and Habitat after four weeks. This increases to 15% discount off at Sainsbury’s every Friday and Saturday, and 15% off at Argos every pay day.\r\n\r\nFree food and hot drinks provided for Colleagues in all our stores.\r\n\r\nGenerous holiday entitlement - based on the hours you work.\r\n\r\nShopping discounts – special offers on gym memberships, restaurants, holidays, retail vouchers and more.\r\n\r\nFamily leave – generous maternity and paternity leave.\r\n\r\nPension – Sainsbury’s will match between 4-7% of your pension contributions.\r\n\r\nSainsbury’s share schemes – allowing you to buy Sainsbury’s shares at discounted prices and the option to buy shares monthly from your gross salary to build up an investment.\r\n\r\nWellbeing support – including free access to our Employee Assistance Programme which is a confidential service providing support and guidance on a wide range of issues.', 12.00, 3, 1, '150 Strand Road', 'Derry/Londonderry', 'BT48 7TL', '2024-01-25'),
(29, 45, 'Deputy Store Manager', 'Store performance bonus on top of pay\r\nFree Shoes\r\nClarks Discount\r\nEducation Grants\r\n\r\nDeputy Store Manager is known in Clarks as Sales & Service Manager.\r\n\r\nThe salary advertised is for a full time position, if part time the salary will be pro rata.\r\n\r\nAs a Sales and Service Manager, you’ll set a shining example of customer service and sales performance for your team. Running the shop floor, merchandising and supporting your team, the unique customer experiences you’ll create demonstrate why Clarks stores hold such a special place on the high street for two centuries.\r\n\r\nYou’ll be well rewarded here. First off, you’ll be given a free pair of shoes to wear for work and you’ll receive a discount card that’ll give you a third off on up to a further 20 pairs of Clarks shoes each year. You and your family will also have access to our Employee Assistance Programme which supports wellbeing too.\r\n\r\nWe’re all about career development. You’ll get all the training and encouragement you need to progress. Work with us for a couple of years and you’ll be able to access education grants to help with tuition costs for you and your family.\r\n\r\nFlexible family leave, employee life cover and maternity/adoption cover—you’ll get great quality of life in return for the great work you do with us. Joining a business that’s serious about meeting its Sustainable Development Goals and donates to the Retail Trust, you’ll be helping build a better future for you, your family and the industry you work in.\r\n\r\nWhat we need from you\r\n\r\nYou’ll have shown your abilities in retail before—that’s why you’ll be confident stepping into the role of Sales and Service Manager. A great communicator, you’ll inspire your team to smash their targets and build great relationships throughout the business. Using retail IT, building rapport and handling customer service issues often all at once, your energy will make you an asset to the team (able to deputise for the manager when required) and you’ll be looking at more senior roles before long.\r\n\r\nAbout Clarks\r\n\r\nClarks, based in Somerset, England, has been at the forefront of innovative shoemaking since its foundation in 1825, when brothers James and Cyrus Clark made a slipper from sheepskin off-cuts. Sparking revolutions and defining generations, Clarks’ archive of over 22,000 pairs includes the inimitable Desert Boot and Wallabee – and a ground-breaking combination of invention and craftsmanship remains at the heart of what the brand does now. Cutting-edge collaborations with cultural icons and KOLs, taking strides in social change, reimagining legendary silhouettes, and making shoes that move with the world ahead – Clarks is never standing still.\r\n\r\nThe benefits\r\n\r\nAs well as a rewarding career, development opportunities and a competitive salary, you’ll also enjoy a generous holiday allowance and the opportunity to join the company pension scheme.\r\n\r\nWe love hearing from great people\r\n\r\nVisit us at clarksjobs.com, follow us on Twitter and become a fan on Facebook. Just look for @JobsatClarks\r\n\r\nAs a global employer, Clarks is committed to embracing diversity throughout our workforce by creating an inclusive environment that reflects the many cultures and locations where we work. We strive to create a productive environment which everyone has an equal chance to succeed at all levels through the organisation. We will not discriminate on the basis of sex, age ,disability, marital status, colour ,race ,religion, ethnic origin, sexual orientation or gender re-assignment’, complying with local legislative requirements', NULL, 1, 16, 'Unit 3 Saintfield Road', 'Belfast', 'BT8 6FX', '2024-02-06'),
(30, 45, 'Sales Team Member', 'If you love footwear, fashion and people, Clarks is the place to be. As a Sales Team Member, you’ll be in the thick of the action, helping customers find shoes they’ll adore.\r\n\r\nThe role\r\n\r\nIn many ways, you’ll be the face of Clarks, welcoming people into your store. You’ll build a rapport with the customer by asking questions about what they want. Then you’ll give great advice to give reassurance and close the sale – maybe suggesting accessories when appropriate. In short, you’ll play an active role in every stage of the end-to-end selling process. With our first-class training, including coaching, observations and product knowledge, you’ll have what it takes to meet targets and performance standards and be the very best you can be. You will also find yourself playing an active role in keeping the store neat and tidy as well as lending a hand in the stockroom.\r\n\r\nAbout you\r\n\r\nGood with people and great in a team, you love dealing with customers. You’re never happier than when you’re on the shop floor, getting hands-on with sales. Your natural instinct for people means you know the right moment to make suggestions – and when to let customers make their decision.\r\n\r\nAn interest in fashion and footwear goes without saying. But it’s also important that you can promote Clarks. A brand ambassador, you champion our products and take pride in being part of a respected global name. Experience in a similar role would help, as would a flexible approach to hours.\r\n\r\nAbout Clarks\r\n\r\nClarks, based in Somerset, England, has been at the forefront of innovative shoemaking since its foundation in 1825, when brothers James and Cyrus Clark made a slipper from sheepskin off-cuts. At the time it was ground-breaking; a combination of invention and craftsmanship that’s remained at the heart of what the brand does now.\r\n\r\nIn the Clarks archive of more than 22,000 pairs are shoes that have sparked revolutions and defined generations. From the original Clarks Desert Boot, first designed by Nathan Clark and launched in 1950 to the iconic Wallabee, each design has an instantly recognisable signature - a unique combination of craftsmanship and innovation that make it unmistakably Clarks.\r\n\r\nClarks is a global business operating retail, wholesale, franchise and online channels in over 100 markets worldwide supported by nearly 10,000 employees across the world.\r\n\r\nThe benefits\r\n\r\nAs well as a rewarding career, development opportunities and a competitive salary, you’ll also enjoy a generous holiday allowance and the opportunity to join the company pension scheme.\r\n\r\nWe love hearing from great people\r\n\r\nVisit us at clarksjobs.com, follow us on Twitter and become a fan on Facebook. Just look for @JobsatClarks\r\n\r\nClarks International believes that the principle of equality of opportunity is fundamental to the company\'s operations. Our long held aim is to provide just and fair treatment for all employees. We will not discriminate on the grounds of sex, age, disability, marital status, colour, race, religion, ethnic origin, sexual orientation or gender reassignment.', NULL, 1, 16, 'Unit 3 Saintfield Road', 'Belfast', 'BT8 6FX', '2024-02-06'),
(31, 46, 'Seasonal Team Member', 'At Homebase, Spring, Summer and Christmas are our busiest times of the year, and when our customers are most inspired to create homes, they love.\r\n\r\nDuring our “peak” seasons, we always look for additional temporary team members to help us make sure that our customers – whether they’re looking for room inspiration, project help, guidance, or information about the latest products and trends – leave with exactly what they are looking for.\r\n\r\nIf you would like to find out what it’s like to be part of a WINNING team, fill out an application TODAY!\r\n\r\nAbout the role:\r\n\r\nStart Date: ASAP\r\n\r\nContract: All of our vacancies are part-time and temporary, with hours varying from 4 to 24 hours per week. All our vacancies require that you be available to work both evenings and weekends.\r\n\r\nSalary: National Living Wage\r\n\r\nDay to Day: You will be helping to make sure our customers have a great experience and helping our stores to stay full, clean, and tidy\r\n\r\nWhat we’re looking for:\r\n\r\nIf you have experience with retail then GREAT but that’s not essential!\r\n\r\nEvery day you’ll be speaking with and helping our customers so it’s important that you offer every person that walks through our doors the exceptional customer service they have come to expect from us. That’s why having the right attitude is our most basic requirement.\r\n\r\nTo us, having the right attitude means always demonstrating your passion and enthusiasm for home and garden and being knowledgeable about our products and stock.\r\n\r\nIf you think you’ve got what it takes and would like to join our team as a Team Member, please click \'Apply’ now.\r\n\r\nWhat can we offer you in return?\r\n\r\nMaking your pay go further\r\n\r\n20% team member discount for Homebase and Bathstore when shopping in-store and online, available from your very first day with us\r\nOur Hapi To Be Home wellbeing portal helps you save money on everything from your weekly food shop to a fun night out with friends and family\r\nHoliday starting from 22 days plus bank holidays, rising with service (pro-rata’d)\r\nSounds like a team you’d like to be part of? Click \'Apply’ now – we’d love to meet you!', NULL, 2, 16, 'Unit 1, Shane Park Shopping Centre, 105 Boucher Road', 'Belfast', 'BT12 6UA', '2024-03-07'),
(32, 46, 'Team Member Garden Centre', 'At Homebase, we share a passion for helping every customer create a home and this shines through in all that we do.\r\n\r\nWe all have a part to play in making Homebase such a fantastic place to work and shop and while our customers are at the heart of everything we do, we know that without our store team members we wouldn’t be here.\r\n\r\nWhen you join our team, our promise to you is that as a part of the Homebase family, we will value you, we will offer you the fantastic training and most importantly we will reward your hard work!\r\n\r\nIf this sounds like a team you would like to be a part of then keep reading, because we’re recruiting now!\r\n\r\nAbout the role:\r\n\r\nSalary: National Living Wage + FANTASTIC bonus earning potential\r\n\r\nHours: Full Time or Part Time – including regular weekends and some evening shifts.\r\n\r\nDay to Day:\r\n\r\nGiving great customer service\r\nDriving sales\r\nOffering expert advice on all things horticulture (and giving a helping hand in other departments when needed)\r\nYou will be helping to make sure our customers have a great experience and helping our stores to stay full, clean and tidy\r\n\r\nWhat we’re looking for:\r\n\r\nWe’re looking for someone who has a passion for all things plants to ensure we give our customers the very best advice to look after their gardens!\r\n\r\nYou have a passion for delivering a great customer experience.\r\nIdeally, you have experience within a customer facing role. with a Passion for Plants\r\nAbility to lift heavy objects as the horti team can be heavily relied on for big moves and large projects in store.\r\nYou work well within a team.\r\nYou show up to work on time, well presented and bring your can do and hardworking attitude along with you.\r\nYou are eager to learn new skills and gain new experiences.\r\nPlant knowledge and experience is essential\r\n\r\nEvery day you’ll be speaking with and helping our customers so it’s important that you offer every person that walks through our doors the exceptional customer service they have come to expect from us. That’s why having the right attitude is our most basic requirement.\r\n\r\nTo us, having the right attitude means always demonstrating your passion and enthusiasm for home and garden and being knowledgeable about our products and stock. Of course, we don’t expect you to know everything on day one (that’s where our amazing training comes in) but we do expect you to want to learn, to work as a part of a team, to strive become as good at your job as you possibly can be and always try your hardest to offer the best customer service.\r\n\r\nIf you think you’ve got what it takes and would like to join our team as a Team Member, please click \'Apply’ now.\r\n\r\nWhat can we offer you in return?\r\n\r\nMaking your pay go further\r\n\r\n20% team member discount for Homebase and Bathstore when shopping in-store and online, available from your very first day with us\r\nWe’ll give you the opportunity to enhance your pay through our fantastic, discretionary bonus plan\r\nOur Hapi To Be Home wellbeing portal helps you save money on everything from your weekly food shop to a fun night out with friends and family\r\nHoliday starting from 22 days plus bank holidays, rising with service\r\nSaving for your future and giving back to local communities\r\n\r\nHomebase Personal Pension Plan (with Life Assurance cover)\r\nAn opportunity to get involved in fundraising events, helping to raise money for our charity partner, Macmillan Cancer Support to fund home-related grants. These grants help keep those most in need safe and comfortable in their homes\r\nOur Payroll Giving Scheme makes it easy for you to make a regular donation to any registered charity close to your heart\r\nAlways growing together\r\n\r\nWe\'ll offer you learning and development opportunities to give you the tools to do your job and there is also the opportunity to earn recognised qualifications from City and Guilds and to gain apprenticeship qualifications to enhance/develop you in your role or career with us\r\nOur monthly Lunch and Learn sessions will help you grow with talks from external and internal speakers\r\nSounds like a team you’d like to be part of? Click \'Apply’ now – we’d love to meet you!', NULL, 1, 16, '6 Ballymena Road', 'Antrim', 'BT41 4NY', '2024-03-03'),
(33, 38, '12hour Supervisor', 'Established in the 1980s and with a steadily growing reputation and fan base for everything outdoors, Trespass – with its 200+ high street stores – needs little introduction. Be it camping, running, rambling, walking or skiing, we’ve got you well-covered and best-equipped for your next adventure – whether that’s scaling a new summit or venturing to the farthest reaches of your high street.\r\n\r\nWHAT WE NEED:\r\n\r\nWe are looking for a strong sales assistant, who wishes to step up to the next level, to help oversee our store on Boucher Road. Shifts will be mainly, Evenings and Weekends. This is a 12hour contract but extra hours maybe given.\r\n\r\nThe applicant needs to have experience of working in retail and be willing to work, on their own and as part of a team. Knowledge of the outdoor sports market would be a great advantage.\r\n\r\nIdeal candidate must have:\r\n\r\nExperience in merchandising within a retail environment.\r\nExperience in dealing with the public.\r\nExperience in cash handling/banking.\r\nSound product knowledge.\r\nSound health & safety knowledge.\r\nAn active participant in outdoor activities.\r\nTrespass are a provider of outdoor and action sports clothing, footwear and equipment. The suitable candidate would benefit from having a background in a suitable retail environment.\r\n\r\nJob Types: Part-time, Permanent\r\n\r\nSalary: £5.48-£10.62 per hour\r\n\r\nBenefits:\r\n\r\nEmployee discount\r\nStore discount\r\nSchedule:\r\n\r\nMonday to Friday\r\nWeekend availability\r\nWork Location: In person', NULL, 1, 16, '3 Boucher Crescent', 'Belfast', 'BT12 6HU', '2024-03-07'),
(34, 47, 'Food and Beverage Assistant - Part Time', 'Job Ref: JI22435\r\nBranch: Leonardo Hotel Belfast\r\nLocation: Leonardo Hotel Belfast\r\nSalary/Benefits: Competitive Salary + Fantastic Benefits\r\nContract type: Permanent\r\nHours: Part Time\r\nShift pattern: Fully flexible including weekends/early and late shifts\r\nHours per week: 20\r\nPosted date: 07/03/2024\r\nClosing date: 09/04/2024\r\n\r\nBe Yourself – Be a Bold Team Player – Be Leonardo\r\n\r\nAs a Food and Beverage Assistant, you’ll be a face of the hotel, so we want you to bring your warm and friendly personality to work with you every day. Take a deep breath because you’ll be stepping into a busy role! You’ll be working as part of a vibrant team to deliver first-class hospitality to our guests in the hotel’s restaurant and bar.\r\n\r\nIf you’re our ideal Food Beverage Assistant, you will:\r\n\r\nBe yourself!\r\nShare your positive energy with guests and your team\r\nEnsure that guests have a great experience in our restaurant and bar, and are leaving with a desire to come back again!\r\nHave a can-do attitude\r\nBe confident in speaking with guests and the team – we love building a good rapport\r\nWhy come join us?\r\n\r\nWe look after our colleagues just as well as we look after our guests. Once you’re part of the team, you’re part of the Leonardo community. In our business, your hard work and pace is valued so it’s our role to keep you at the top of your game as a Hospitality professional! Our “GROWonline” learning portal ensures you develop the knowledge and skills you need, along with regular coaching and training from your manager. Our regular Learning Bites, “Come Join Us Guest Care” training and Wellness webinars all help your progress with us. With support on tap, top-notch practical training and clear progression you’ll be on track for a brilliant future in Hospitality!\r\n\r\nOur Story\r\n\r\nBuilt on decades of hotelier know-how, we are part of the Fattal Hotels Group, which operates over 230 hotels across Europe and Israel. We look after over 50 hotels across the UK Ireland and have plans for major expansion over the next few years - there’s never been a more exciting time to join us!\r\n\r\nSome of the perks our colleagues enjoy include:\r\n\r\nSpecial rates on Leonardo Hotel rooms across the UK Europe: get planning that city break you’ve been dreaming of!\r\nCompany-wide recognition scheme: for being your fabulous self, you could earn vouchers to spend on a wide range of high street shops\r\nFree hot meals whilst on duty\r\nTalent referral scheme: earn yourself a bonus for recommending a friend to join us\r\nWe love to get together and celebrate: we regularly host Thank You Week (your hotel could have anything from ice cream trucks to pizza parties) and every year we get dressed up in our fanciest threads to host our Employee Awards Celebration\r\nThe important stuff: access to the Company Pension Scheme, Life Assurance and Wellbeing Support\r\nOngoing job-related training programmes with clear paths for progression\r\nAbout Leonardo Hotel Belfast\r\nSituated in the heart of the city, our Belfast hotel has much to offer the business traveller or culture vulture looking to explore the area. With Assembly Buildings Conference Exhibition Centre over the road and Great Victoria Street station a three minute walk away; our hotel in Belfast is ideally placed for those visiting for business.\r\n\r\nHowever, Belfast is bursting with energy and has plenty to offer our pleasure guests. Jurys Inn is one of the most convenient hotels in Belfast - only a minute away from the beautiful Grand Opera House, Belfast under ten minutes\' walk from two of the city’s retail hotspots: Victoria Square Castlecourt Shopping Centres, and just 12 minutes\' walk from the beautiful Albert Clock landmark. The hotel is also 20 minutes\' walk from the must see Titanic Visitor Centre, Dock Pump House as well as a 15 minutes\' walk from Queens University, Botanic Gardens and Ulster Museum.\r\n\r\n\r\nAbout Leonardo Hotels\r\nAt Leonardo Hotels, our vision is very simple: to be the first choice for everyone who values genuine hospitality.\r\n\r\nBuilt on decades of hotelier know-how, we are part of the Fattal Hotels Group, which operates over 230 hotels across Europe and Israel. We look after over 50 hotels here in the UK Ireland, and have come a long way since we opened our first hotel in Ireland back in 1993! With approximately 4,000 employees and multiple brands we are a dynamic, innovative and fast-growing company.\r\n\r\nAs an employer we put a big emphasis on career development and as a rule we recruit our operations team members for personality- it is all about how you interact with others and how you can demonstrate our values: Consistent, Friendly, Genuine, Positive and Willing.\r\n\r\nAt Leonardo Hotels each and every team member is individually valued and respected for who you are. All careers within our hotels offer customer interaction, a great deal of variety, and a fun and friendly working environment. We strive to make all of our hotels great places to work, and get our teams involved in activities such as summer barbecues, Christmas parties, Thank You Week and birthday celebrations!\r\n\r\nWe also offer excellent employee benefits, including huge discounts on overnight stays at our hotels as well as performance-based rewards via our Leo Points system- these range from vouchers to a well-deserved day off!', NULL, 1, 17, '44 Great Victoria Street', 'Belfast', 'BT1 6DY', '2024-02-26'),
(35, 20, 'Dominos Instore Team Member', 'Team Member – Domino’s\r\n\r\nDo you have the right ingredients?\r\n\r\nWe’ll show you how to create high quality pizzas and delicious side orders to delight our customers every time they order from us. When we talk about creating high quality pizzas, we are talking about the perfect pizza base, made from our fresh dough, placing our delicious toppings, right down to the perfect cut and boxing to ensure the best, every single time.\r\n\r\nHere\'s what we’re looking for\r\n\r\nSomeone who is outgoing, friendly personality with good communication skills. You’ll be the face of Domino’s Pizza in our store.\r\n\r\nTeam working skills – you’ll be interacting a lot with your colleagues within a busy team in a fast-paced environment\r\n\r\nWhy join us?\r\n\r\n· Great career progression opportunities\r\n\r\n· Personal development\r\n\r\n· Paid holiday\r\n\r\n· Free uniform\r\n\r\n· Flexible Hours\r\n\r\n· Pension Scheme\r\n\r\n· Staff Discount\r\n\r\nWhether this is your first job or you’re looking to try something different, me might just have a great opportunity for you! No previous pizza making experience is required, just a willingness to learn and develop.\r\n\r\nJob Types: Full-time, Part-time, Permanent\r\n\r\nSalary: Up to £11.98 per hour\r\n\r\nBenefits:\r\n\r\nDiscounted or free food\r\nStore discount\r\nSchedule:\r\n\r\nWeekend availability\r\nWork Location: In person', 11.98, 1, 14, '235 Antrim Road', 'Belfast', 'BT15 2GZ', '2024-02-14'),
(36, 19, 'Customer Sales Advisor', 'Got a knack with customers?\r\n\r\nIdeally, you already have Retail sales experience but if you’ve worked in another customer focused sales environment, we’re likely to be a great fit for each other.\r\n\r\nYou’re already a legend at quick and efficient working, and we’ll give you the product knowledge and skills training you need to wow every customer. You’ll learn how to demonstrate and explain our products as well as the practical aspects of our fitting services.\r\n\r\nWe invest heavily in training to give our colleagues skills to develop their careers, so whatever career path you want to follow and whatever pace you want to progress, we have the support here to help you make your ambitions a reality, whether it’s in Retail or elsewhere in the Group.\r\n\r\nTo be successful in this role you will need:\r\n\r\nExperience of delivering great customer service, ideally in a retail sales environment\r\nA proactive approach to helping customers and understanding their needs\r\nProblem solving skills\r\nAvailability to work on a rota basis, including weekends\r\nIdeally, some experience of working towards and achieving sales targets\r\nWe know that everyone has different priorities at different stages of their lives, so we offer a wide range of rewards and benefits. As well as holiday and contributory company pension, you can expect to enjoy:\r\n\r\nStore discount, with 25% off most products across Halfords and Tredz\r\nEmployee discount, with up to 50% off your garage bills at Halfords Autocentre\r\nDiscount on Halfords Breakdown Cover, with bike cover as standard for all annual policies\r\nDiscounts on everything from groceries and shopping through to holidays, insurance, days out, restaurants and more\r\nEmployee wellness programme offering free, independent, confidential support and counselling 24 hours a day, seven days a week\r\nFantastic Trade Price Bike Scheme - buy one bike per year from a range of bikes which have been significantly reduced\r\nLife Assurance\r\nUniform\r\nOption to join our Sharesave scheme: save to purchase shares at a 20% discount\r\nCycle to Work scheme\r\nWagestream – a financial planning app that gives you more control over your pay. Access up to 30% of your pay as you earn it and save automatically from your salary to build a rainy-day fund for the future\r\nHealth Cash Plan - claim cash back towards your healthcare costs and get access to health and well-being services\r\nWe’re in an exciting chapter – rapidly growing our business with a focus on motoring services and electric mobility. We’re the UK’s leading retailer of motoring and cycling products and services, and the UK’s largest vehicle service, maintenance and repair business. Join us and be part of our success story in getting the nation safely back on the move.', 10.62, 1, 16, '8 Boucher Road', 'Belfast', 'BT12 6HH', '2024-02-01'),
(37, 43, 'Front of House Team Member', 'Hourly Rate: £10.42\r\nThis may differ for under 18s\r\n\r\nWe’re on the search for Front of House Nandocas (what we call our Team Members) to join us! The Role of a Front of House Nandoca is simple… to create unforgettable customer moments and feelings to leave them wowed and want them coming back for more.\r\n\r\nWhat I do\r\n\r\nI make our guests feel valued as part of our family by creating a fun and relaxed environment for them to enjoy. It’s up to me to make sure our guests leave feeling happy, having had a really positive Nando’s experience.\r\n\r\nI give a warm welcome to our guests and make them feel at home\r\nI serve customers efficiently at the till – understanding and meeting their needs\r\nI serve amazing food to Nando’s high standards that make our guests feel fired up and wowed by the experience\r\nI bring amazing food and drink to the table and make sure our customers have everything they need\r\nI manage the takeaway customer experience\r\nI set up, maintain, hand over and close down a clean, safe and fully operational restaurant floor\r\nI handle deep cleaning to Nando’s high standards\r\nI follow all fire safety, health and safety, food hygiene and restaurant security measures\r\nThere are loads of perks to being a part of our Front of House team:\r\n\r\na free meal on every shift you work\r\na great discount platform\r\ndiscount on Nando’s for you and your friends (40% Mon-Thurs, 20% Fri-Sun)\r\nregular regional parties and events\r\nTo join us apply today!\r\n\r\nAt Nando’s, everyone is welcome. Inspired by our Southern African heritage we know and value the richness that diversity brings to Nando’s. We’re committed to creating an inclusive and respectful culture for all; including our existing and future Nandocas, partners and suppliers, customers and the communities we are a part of. We deliberately work hard to create an environment where every individual is valued, respected and can ﬂourish regardless of who they are, their background or outlook on life.\r\nWe welcome applications from a diverse range of individuals and will consider any reasonable adjustments in order to enable candidates to perform as well as possible during the recruitment process.”', 10.42, 1, 14, '24 Ormeau Avenue', 'Belfast', 'BT2 8HS', '2024-03-01'),
(38, 43, 'Front of House Nandoca', 'Hourly Rate: £10.42\nThis may differ for under 18s\n\nWe’re on the search for Front of House Nandocas (what we call our Team Members) to join us!\n\nThe Role of a Front of House Nandoca is simple… to create unforgettable customer moments and feelings to leave them wowed and want them coming back for more.\n\nWe offer full and part-time positions, and no previous experience is required, just show us that you’re brimming with passion and willing to learn and we will teach you the rest.\n\nWhat I do\n\nI make our guests feel valued as part of our family by creating a fun and relaxed environment for them to enjoy.\n\nI give a warm welcome to our guests and make them feel at home\n\nI serve customers efficiently at the till – understanding and meeting their needs\n\nI serve amazing food to Nando’s high standards that make our guests feel fired up and wowed by the experience\n\nI bring amazing food and drink to the table and make sure our customers have everything they need\n\nI follow all fire safety, health and safety, food hygiene and restaurant security measures\n\nThere are loads of perks to being a part of our Front of House team:\n\nFree meal on every shift you work\n\nFlexible shifts\n\nAccess to a great discount platform\n\nDiscount on Nando’s for you and your friends and family (40% everyday)\n\nInternal development programmes to support your career development\n\nRegular regional parties and events\n\nRefer a friend incentive scheme\n\nTo join us apply today!\n\nAt Nando’s, everyone is welcome. Inspired by our Southern African heritage we know and value the richness that diversity brings to Nando’s. To find out more click here\n\nPlease note: We know you might be keen to start earning your own cash, but legislation on health & safety is incredibly important to us so you can only become a Nando’s Team Member once you’ve finished school. When the time is right we’d love to see your application to become a Nando’s Team Member and you can get free PERi goodness on every shift you work.', 10.42, 1, 14, '9 Boucher Crescent', 'Belfast', 'BT12 6HU', '2024-02-11');
INSERT INTO `JobListings` (`ListingID`, `CompanyID`, `Title`, `Description`, `Salary`, `ContractTypeID`, `SectorID`, `StreetAddress`, `City`, `PostCode`, `PostDate`) VALUES
(39, 18, 'Store Team Member', 'Job Introduction\r\nOur Store Team Members deliver outstanding customer service by greeting customers, assisting with product queries and providing a prompt service with a smile.\r\n\r\nStore Team Members at Home Bargains cover a range of store duties including customer service, stock replenishment, cash handling and helping to maintain excellent store standards.\r\n\r\nJob Overview\r\nCandidates will be hardworking, enjoy working in a retail store and have experience of cash handling and processing deliveries.\r\n\r\nSuccessful candidates are provided with on-the-job training and gain essential transferable retail skills.\r\n\r\nIf you are honest and reliable and take pride in what you do then we would love to hear from you!\r\n\r\nMinimum Criteria To Apply\r\nDemonstrate a good understanding of customer service\r\nExperience of cash handling and working in a retail environment\r\nExperience of manual handling and stock replenishment\r\nHardworking and reliable\r\nPolite and professional\r\nFor applications to be considered, applicants are required to have a complete and up-to-date Home Bargains Careers Centre profile and to respond to the job application questionnaire when prompted.\r\n\r\nApplicants that are invited to attend a face-to-face interview must present original documentation demonstrating their eligibility to work in the UK, along with other specified documents.\r\n\r\nPlease note, as we expect to receive a high volume of applications for this vacancy, you are advised to submit your fully completed application at the earliest opportunity, as the closing date may be brought forward.\r\n\r\nAbout The Company\r\nTJ Morris Limited trading as Home Bargains is a privately owned family run discount retailer selling top brands at the lowest possible price on the UK high street.\r\n\r\nHaving started 45 years ago in Liverpool our customers continue to be at the heart of everything we do and throughout our 580 stores we have over 5 million customers each week.\r\n\r\nWith plans to increase our store portfolio to 1,000 stores throughout the UK we are a fast-paced retailer opening 50 stores a year (nearly one every weekend) - and we wouldn\'t have it any other way!\r\n\r\nPackage\r\n5.6 weeks paid holiday per year including bank and public holiday allowance rising to 6.6 weeks upon 5 years\' service\r\nContributable Company pension scheme\r\nStaff uniform\r\n10% store discount\r\nAccess to social and sporting events\r\nEmployee benefits\r\n\r\nMyHB employee benefits platform with access to:\r\n\r\nRetail and leisure discounts plus hundreds more\r\nFree Financial Advice\r\nBank your savings into an ISA\r\n24/7 confidential counselling and advice line\r\nLow cost voluntary insured health plans\r\nStore Team Member rates of pay depend on age, ranging from £7.48 per hour for below 18 year olds, £9.06 for 18 - 20 year olds, and £10.86 for those 21 and over.\r\n\r\nAvailable contracted hours range from 8 - 20 hours per week.', 7.48, 1, 16, '8 Bannview Road', 'Banbridge', 'BT32 4LF', '2024-03-05'),
(40, 44, 'Retail Team Member - Dromore', 'Job Title: Retail Team Member\r\nDepartment: Retail\r\nReporting to: Shop Manager/Regional Manager\r\nLocation: Dromore\r\n\r\nYour Role:\r\nA Retail Team Member with BoyleSports is the first point of contact for our customers in-store. The day-to-day role would be to assist the Shop Manager and team with the running of the branch. You will prepare the shop for the day ahead, hanging papers and stocking coupons, slips and pens, you will ensure high standards are maintained throughout the day all the while taking and paying out bets and delivering excellent customer service. You will be given the tools to expand your knowledge base on all things sports and betting-related.\r\nYou will need to be a people person with enthusiasm and drive to progress to the Manager level and beyond….\r\nKey Responsibilities:\r\n\r\nAssist the Manager with the day-to-day running of the business\r\nAccept bets as per procedure and in a timely manner.\r\nAccurately process bets through the EPOS System.\r\nEnsure that all procedures are followed.\r\nCash management.\r\nKeep shop standards to a high quality.\r\nAdhere to Social Responsibility duties.\r\nRequirements:\r\n\r\nMust be over the age of 18.\r\nA drive for creating customer relationships.\r\nA strong eye for detail.\r\nBe adaptable and have the ability to react quickly.\r\nBe flexible as our business operates 7 days a week.\r\nStrong communication skills.\r\nTraining & Development\r\nIn BoyleSports we take pride in our staff, and we want to help encourage their professional development. Within the company, we offer two routes to progression.\r\nThe traditional route is to progress on to Trainee Assistant Manager and begin your journey towards management. Training is delivered on the job with the support of our training and development team.\r\nWe also recognize that our Retail Team Members become product experts and the experience and knowledge gained in our retail branches is invaluable across our business. Many of our Retail colleagues have progressed on to roles within our Trading, Marketing, HR, IT Departments and more, in our Dundalk HQ or our Gibraltar and Manila offices.\r\nStaff Benefits\r\n\r\nFlexible work patterns. Ideal for those looking for either part-time or full-time employment. Work with us and we will work with you.\r\nLife Assurance Scheme\r\nPension contribution is matched to 4%\r\nBike-to-work scheme\r\nStaff competitions\r\nSavings scheme\r\nStaff bonuses and incentives\r\nEmployee Assistance Program\r\nRefer a Friend Scheme\r\nWedding and Baby Gifts\r\nMany opportunities for career progression\r\nBoyleSports are an equal opportunities employer, and we welcome applications from all suitably qualified persons.\r\nIND1\r\n\r\nJob Type: Part-time\r\n\r\nWork Location: In person', NULL, 1, 16, '1A Princes Street', 'Dromore', 'BT25 1AY', '2024-02-27');

-- --------------------------------------------------------

--
-- Table structure for table `JobListingSkills`
--

CREATE TABLE `JobListingSkills` (
  `JobListingID` int(11) NOT NULL,
  `SkillID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `JobListingSkills`
--

INSERT INTO `JobListingSkills` (`JobListingID`, `SkillID`) VALUES
(1, 2),
(1, 27),
(1, 35),
(2, 7),
(2, 33),
(2, 39),
(4, 8),
(4, 9),
(4, 16),
(5, 27),
(5, 28),
(5, 34),
(6, 8),
(6, 9),
(6, 15),
(7, 2),
(7, 34),
(7, 45),
(8, 42),
(8, 48),
(9, 2),
(9, 34),
(9, 45),
(10, 8),
(10, 9),
(10, 16),
(11, 20),
(11, 22),
(11, 25),
(11, 31),
(11, 41),
(12, 6),
(12, 31),
(12, 34),
(12, 41),
(13, 6),
(13, 33),
(13, 34),
(13, 41),
(14, 3),
(14, 6),
(14, 7),
(14, 38),
(15, 2),
(15, 32),
(15, 48),
(16, 8),
(16, 9),
(16, 45),
(17, 3),
(17, 7),
(17, 34),
(17, 45),
(18, 2),
(18, 16),
(18, 28),
(19, 12),
(19, 13),
(19, 14),
(19, 29),
(20, 2),
(20, 10),
(20, 14),
(20, 29),
(21, 42),
(21, 48),
(22, 40),
(22, 42),
(22, 45),
(23, 33),
(23, 47),
(24, 3),
(24, 46),
(24, 47),
(25, 15),
(25, 50),
(26, 32),
(26, 42),
(26, 43),
(27, 15),
(27, 39),
(28, 3),
(28, 34),
(29, 7),
(29, 9),
(29, 17),
(30, 2),
(30, 33),
(30, 45),
(31, 2),
(31, 33),
(31, 45),
(32, 2),
(32, 50),
(33, 8),
(33, 9),
(33, 17),
(34, 2),
(34, 45),
(34, 48),
(35, 2),
(35, 48),
(36, 2),
(36, 37),
(36, 45),
(37, 2),
(37, 31),
(37, 42),
(38, 31),
(38, 42),
(38, 45),
(39, 3),
(39, 44),
(39, 45),
(40, 2),
(40, 33),
(40, 34),
(40, 45);

-- --------------------------------------------------------

--
-- Stand-in structure for view `JobsCurrentlyAppliedFor`
-- (See below for the actual view)
--
CREATE TABLE `JobsCurrentlyAppliedFor` (
`ListingID` int(11)
,`JobTitle` varchar(255)
,`ApplicationID` int(11)
,`ApplicantForename` varchar(50)
,`ApplicantSurname` varchar(50)
,`ApplicationDate` date
,`ApplicationStatus` varchar(50)
);

-- --------------------------------------------------------

--
-- Table structure for table `JobSeekerCV`
--

CREATE TABLE `JobSeekerCV` (
  `CV_ID` int(11) NOT NULL,
  `JobSeekerID` int(11) NOT NULL,
  `TextCV` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `JobSeekerCV`
--

INSERT INTO `JobSeekerCV` (`CV_ID`, `JobSeekerID`, `TextCV`) VALUES
(1, 1, 'Oliver Smith\n       26 University Street\n       osmith@gmail.com\n       07123456789\n       Hi, I am Oliver Smith. I\'m a student, wanting to work around my classes while I study at Queens University Belfast.\n       Work Experience:\n       Bar and Waiting Staff\n       J D Wetherspoon PLC - Belfast\n       September 2023 to Present\n       Whenever I worked at Wetherspoons, I learned how to deal with customers in an efficient manner, always having great patience for them but ensuring company rules come first.\n       Education:\n       - Bachelor\'s Degree in Computer Science\n       Queen\'s University Belfast - Belfast\n       September 2023 to Present\n       - A-Level in Mathematics, Computer Science and Business Studies\n       Bangor Grammar School - Bangor\n       August 2021 to August 2023\n       - GCSE in Further Mathematics, Mathematics, Computer Science, Business Studies, Physics, French, Drama, English Literature, English Language\n       Bangor Grammar School - Bangor\n       August 2019 to August 2021'),
(2, 1, 'Oliver Smith\n       26 University Street\n       osmith@gmail.com\n       07123456789\n       Hello, I am Oliver Smith. I\'m a hard worker who prioritises customer service over my own free time.\n       Work Experience:\n       Bar and Waiting Staff\n       J D Wetherspoon PLC - Belfast\n       September 2023 to Present\n       My time at Wetherspoons taught me one thing, the customer is always right. With this knowledge I know that no matter how unrulely the customer, they deserve patience and peace of mind, and any compromises should be made in order to ensure repeat customers.\n       Education:\n       - Bachelor\'s Degree in Computer Science\n       Queen\'s University Belfast - Belfast\n       September 2023 to Present\n       - A-Level in Mathematics, Computer Science and Business Studies\n       Bangor Grammar School - Bangor\n       August 2021 to August 2023\n       - GCSE in Further Mathematics, Mathematics, Computer Science, Business Studies, Physics, French, Drama, English Literature, English Language\n       Bangor Grammar School - Bangor\n       August 2019 to August 2021'),
(3, 2, 'Amelia Jones\r\n       27 Kinwood Grange\r\n       ajones@gmail.com\r\n       07987654721\r\n       I\'m Amelia Jones, a hard working team player that has plenty of experience in the retail market.\r\n       Work Experience:\r\n       Retail Sales Assistant\r\n       Trespass - Belfast\r\n       January 2022 to Present\r\n       At Trespass, I\'ve had to deal with many customer questions, along with dealing with cash and all other sorts of responsibilities that come along with the job.\r\n       Education:\r\n       - Bachelor\'s Degree in Marketing\r\n       Ulster University - Belfast\r\n       September 2020 to May 2023\r\n       - A-Level in Mathematics, Drama and Business Studies\r\n       Regent House Grammar School - Bangor\r\n       August 2018 to August 2020\r\n       - GCSE in Further Mathematics, Mathematics, Computer Science, Business Studies, Physics, French, Drama, English Literature, English Language\r\n       Bangor Grammar School - Bangor\r\n       August 2015 to August 2018'),
(4, 4, 'Isla Taylor\r\n       20 Benmore Street\r\n       itaylor@gmail.com\r\n       07894321654\r\n       I\'ve been working for years as a Translator for French and English Speakers, if you need a translator, appelez-moi!\r\n       Work Experience:\r\n       French to English Translator\r\n       TranslationCenter - Belfast\r\n       March 2020 to Present\r\n       With TranslationCenter, I\'ve been a key translator in many business relationships, that have hired out my, and my co-workers, skills in translation for multi-language business opportunities.\r\n       Education:\r\n       - Master\'s Degree in French\r\n       Ulster University - Belfast\r\n       September 2019 to May 2023\r\n       - A-Level in French, English Language\r\n       Regent House Grammar School - Bangor\r\n       August 2016 to August 2018\r\n       - GCSE in Mathematics, Physics, French, English Literature, English Language\r\n       Bangor Grammar School - Bangor\r\n       August 2014 to August 2016'),
(5, 16, 'Emily Wright\r\n    1 McClintock Street\r\n    ewright@gmail.com\r\n    07901234567\r\n    I\'ve been a translator for a long time now, learning all languages there is to know.\r\n    Work Experience:\r\n    Multilingual Translator\r\n    TranslationCenter - Belfast\r\n    November 2000 to Present\r\n    I started only knowing two languages, but quickly rose to become fluent in five of the most popular languages in the world.\r\n    Education:\r\n    - GCSE in Spanish, French, German, English Language\r\n    St Dominic\'s Grammar School - Belfast\r\n    August 1998 to August 2000'),
(6, 45, 'Ivy King\n    28 Elm Street\n    iking@gmail.com\n    07789012345\n    A true leader is needed to run your company the way you want, I\'m your guy.\n    Work Experience:\n    Team Leader\n    Eurospar - Belfast\n    November 2000 to April 2018\n    Working my way up from Sales Assistant to Team leader was a challenging, but rewarding period of my life, and with my 10+ years of experience running a store, I can use these skills to guide your team in the right direction.'),
(7, 41, 'Poppy Thompson\r\n    14 Pine Close\r\n    pthompson@gmail.com\r\n    07987654321\r\n    I am an experienced programmer, with many years of experience in Python and Cloud Computing that I can use to best suit your needs.\r\n    Work Experience:\r\n    Software Engineer\r\n    Microsoft - Dublin\r\n    December 2015 to Present\r\n    Starting off with work experience with Microsoft, they took me in and taught me how to do the best job possible, in the smallest amount of time. I would be a valuable asset to any business that needs a professional, skilled programmer in any coding language, as I am quite quick at learning on the job.\r\n    Education:\r\n    A-Level in Computer Science, Further Mathematics\r\n    Killard House School - Donaghadee\r\n    August 2013 to August 2015\r\n    GCSE in Computer Science, Mathematics, Further Mathematics, Spanish\r\n    Killard House School - Donaghadee\r\n    August 2011 to August 2013\r\n    Awards:\r\n    Microsoft Work Experience Certificate\r\n    June 2015 to November 2015\r\n    I worked with Microsoft during the summer of 2015 in order to secure an internship with them after I had finished my A-Levels.');

-- --------------------------------------------------------

--
-- Table structure for table `JobSeekers`
--

CREATE TABLE `JobSeekers` (
  `JobSeekerID` int(11) NOT NULL,
  `Forename` varchar(50) NOT NULL,
  `Surname` varchar(50) NOT NULL,
  `Email` varchar(100) NOT NULL,
  `Phone` varchar(15) NOT NULL,
  `StreetAddress` varchar(255) NOT NULL,
  `City` varchar(100) NOT NULL,
  `Postcode` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `JobSeekers`
--

INSERT INTO `JobSeekers` (`JobSeekerID`, `Forename`, `Surname`, `Email`, `Phone`, `StreetAddress`, `City`, `Postcode`) VALUES
(1, 'Oliver', 'Smith', 'osmith@gmail.com', '07123456789', '26 University Street', 'Belfast', 'BT1 4AB'),
(2, 'Amelia', 'Jones', 'ajones@gmail.com', '07987654721', '27 Kinwood Grange', 'Bangor', 'BT19 4WU'),
(3, 'Noah', 'Williams', 'nwilliams@gmail.com', '07321987654', '14 Linenhall Street', 'Armagh', 'BT61 4JG'),
(4, 'Isla', 'Taylor', 'itaylor@gmail.com', '07894321654', '20 Benmore Street', 'Newry', 'BT35 4EQ'),
(5, 'Jack', 'Brown', 'jbrown@gmail.com', '07789022343', '34 Drumard Crescent', 'Lisburn', 'BT28 3DG'),
(6, 'Olivia', 'Davies', 'odavies@gmail.com', '0790134567', '1 McClintock Street', 'Belfast', 'BT10 4AH'),
(7, 'George', 'Evans', 'gevans@gmail.com', '07456789012', '12 Silverbirch Street', 'Bangor', 'BT20 3QR'),
(8, 'Ava', 'Wilson', 'awilson@gmail.com', '07012345678', '43 Ardress Road', 'Craigavon', 'BT65 4XY'),
(9, 'Harry', 'Patel', 'hpatel@gmail.com', '07567890153', '83 Armagh Road', 'Portadown', 'BT62 3PL'),
(10, 'Mia', 'Johnson', 'mjohnson@gmail.com', '07234567890', '4 Wellington Place', 'Enniskillen', 'BT74 3PS'),
(11, 'Leo', 'Roberts', 'lroberts@gmail.com', '07987654391', '5 Cameron Park', 'Ballymena', 'BT42 4GU'),
(12, 'Ivy', 'Thomas', 'ithomas@gmail.com', '07123456789', '81 Ratheen Avenue', 'Cookstown', 'BT80 3PT'),
(13, 'Arthur', 'Hill', 'ahill@gmail.com', '07321957354', '1 McClintock Street', 'Belfast', 'BT52 1NH'),
(14, 'Florence', 'Lewis', 'flewis@gmail.com', '07894321654', '74 Shandon Park', 'Omagh', 'BT78 1TE'),
(15, 'Freddie', 'Clarke', 'fclarke@gmail.com', '07789012245', '18 Bellair Park', 'Larne', 'BT40 3XW'),
(16, 'Emily', 'Wright', 'ewright@gmail.com', '07901234567', '1 McClintock Street', 'Belfast', 'BT53 3YW'),
(17, 'Henry', 'Harrison', 'hharrison@gmail.com', '07456789012', '4 Ellis Street', 'Carrickfergus', 'BT38 1FG'),
(18, 'Sophia', 'Allen', 'sallen@gmail.com', '0701245678', '4 Downe Avenue', 'Downpatrick', 'BT30 6DR'),
(19, 'Oscar', 'Wood', 'owood@gmail.com', '07567890123', '37 Carmeen Gardens', 'Newtownards', 'BT23 4HN'),
(20, 'Amelia', 'Edwards', 'aedwards@gmail.com', '07234567890', '19 Beechwood Street', 'Banbridge', 'BT32 4ZS'),
(21, 'Alfie', 'Scott', 'ascott@gmail.com', '07987654321', '2 Dromain Drive', 'Antrim', 'BT41 3PL'),
(22, 'Charlotte', 'Lloyd', 'clloyd@gmail.com', '07123456789', '27 Princeton Drive', 'Lurgan', 'BT66 6DS'),
(23, 'Thomas', 'Hill', 'thill@gmail.com', '07321987654', '7 Shanreagh Park', 'Limavady', 'BT49 1FG'),
(24, 'Poppy', 'Cook', 'pcook@gmail.com', '07894321654', '5 Highfield Crescent', 'Magherafelt', 'BT45 6JQ'),
(25, 'Jacob', 'Murphy', 'jmurphy@gmail.com', '07789012345', '1 Lansdowne Lane', 'Portrush', 'BT56 8WT'),
(26, 'Aria', 'Parker', 'aparker@gmail.com', '07901234567', '1 Pine Road', 'Holywood', 'BT18 9YH'),
(27, 'Ella', 'Bailey', 'ebailey@gmail.com', '07456789012', '13 Maple Street', 'Dungannon', 'BT70 1TE'),
(28, 'William', 'Reid', 'wreid@gmail.com', '07012345678', '26 Birch Close', 'Ards', 'BT23 1LU'),
(29, 'Lily', 'Graham', 'lgraham@gmail.com', '07567890123', '9 Oak Avenue', 'Strabane', 'BT82 8PT'),
(30, 'James', 'Thomas', 'jthomas@gmail.com', '07234567890', '24 Willow Way', 'Craigavon', 'BT64 2PS'),
(31, 'Evie', 'Hughes', 'ehughes@gmail.com', '07987654321', '7 Cedar Lane', 'Ballyclare', 'BT39 9NH'),
(32, 'Noah', 'Price', 'nprice@gmail.com', '07123456789', '12 Maple Road', 'Ballynahinch', 'BT24 8GU'),
(33, 'Isabella', 'Watson', 'iwatson@gmail.com', '07321987654', '17 Birch Avenue', 'Armagh', 'BT61 1DR'),
(34, 'George', 'Mitchell', 'gmitchell@gmail.com', '07894321654', '30 Pine Close', 'Bangor', 'BT20 3DR'),
(35, 'Ava', 'Carter', 'acarter@gmail.com', '07789012345', '3 Oakwood Court', 'Downpatrick', 'BT30 9WT'),
(36, 'Freddie', 'Cook', 'fcook@gmail.com', '07901234567', '18 Willow Way', 'Banbridge', 'BT32 4PS'),
(37, 'Sophia', 'Bell', 'sbell@gmail.com', '07456789012', '25 Willow Lane', 'Belfast', 'BT12 4RH'),
(38, 'Jacob', 'Phillips', 'jphillips@gmail.com', '07012345678', '10 Cedar Street', 'Coleraine', 'BT52 1HR'),
(39, 'Charlotte', 'Harrison', 'charrison@gmail.com', '07567890123', '27 Maple Avenue', 'Carrickfergus', 'BT38 1JG'),
(40, 'Arthur', 'Jackson', 'ajackson@gmail.com', '07234567890', '1 Elm Road', 'Newtownards', 'BT23 4WU'),
(41, 'Poppy', 'Thompson', 'pthompson@gmail.com', '07987654321', '14 Pine Close', 'Lisburn', 'BT28 3DR'),
(42, 'Oscar', 'Rossi', 'orossi@gmail.com', '07123456789', '22 Willow Grove', 'Ballymena', 'BT42 1TE'),
(43, 'Emily', 'Griffiths', 'egriffiths@gmail.com', '07321987654', '4 Cedar Lane', 'Bangor', 'BT19 1RH'),
(44, 'Alfie', 'Morris', 'amorris@gmail.com', '07894321654', '11 Birch Road', 'Limavady', 'BT49 1PS'),
(45, 'Ivy', 'King', 'iking@gmail.com', '07789012345', '28 Elm Street', 'Omagh', 'BT78 1HR'),
(46, 'Steven', 'Moffat', 'smoffat@gmail.com', '07729504823', '1 McClintock Street', 'Belfast', 'BT2 7GL'),
(47, 'Shawn', 'House', 'shouse@gmail.com', '07195738592', '29 Kinwood Grange', 'Bangor', 'BT19 4WU'),
(49, 'Karl', 'Bark', 'kbark@gmail.com', '07725946825', '1 mcClintock Street', 'Belfast', 'BT2 7GL'),
(50, 'Curtis', 'McCartney', 'cmccartney@gmail.com', '02748395718', '5 Unknown Ville', 'Belfast', 'BT1 ABC');

-- --------------------------------------------------------

--
-- Table structure for table `JobSeekerSkills`
--

CREATE TABLE `JobSeekerSkills` (
  `SeekerID` int(11) NOT NULL,
  `SkillID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `JobSeekerSkills`
--

INSERT INTO `JobSeekerSkills` (`SeekerID`, `SkillID`) VALUES
(1, 3),
(2, 2),
(3, 19),
(4, 2),
(4, 22),
(5, 6),
(5, 50),
(6, 11),
(6, 46),
(7, 3),
(7, 11),
(7, 12),
(8, 14),
(8, 18),
(9, 1),
(9, 17),
(10, 13),
(10, 27),
(11, 39),
(11, 43),
(12, 42),
(12, 45),
(13, 35),
(13, 45),
(13, 48),
(14, 24),
(14, 31),
(15, 3),
(15, 30),
(16, 20),
(16, 21),
(16, 22),
(16, 23),
(16, 25),
(17, 26),
(17, 27),
(18, 11),
(18, 29),
(19, 8),
(19, 9),
(20, 12),
(20, 13),
(21, 1),
(21, 28),
(22, 16),
(22, 28),
(23, 18),
(23, 26),
(23, 36),
(24, 29),
(24, 42),
(24, 43),
(25, 37),
(25, 49),
(26, 42),
(26, 43),
(26, 48),
(27, 1),
(27, 37),
(27, 52),
(28, 3),
(28, 51),
(29, 4),
(29, 5),
(30, 10),
(30, 16),
(31, 30),
(31, 33),
(31, 34),
(32, 27),
(32, 39),
(32, 44),
(33, 3),
(33, 6),
(33, 28),
(34, 40),
(34, 42),
(34, 43),
(34, 48),
(35, 16),
(35, 31),
(35, 45),
(36, 3),
(36, 12),
(36, 15),
(37, 2),
(37, 7),
(37, 15),
(38, 3),
(38, 4),
(38, 17),
(39, 9),
(39, 32),
(39, 47),
(40, 3),
(40, 5),
(40, 14),
(40, 18),
(41, 3),
(41, 10),
(41, 12),
(41, 13),
(42, 28),
(42, 42),
(43, 32),
(43, 40),
(43, 43),
(44, 33),
(44, 34),
(44, 35),
(45, 1),
(45, 7),
(45, 9),
(45, 20),
(45, 33),
(45, 37);

-- --------------------------------------------------------

--
-- Stand-in structure for view `RetailJobListings`
-- (See below for the actual view)
--
CREATE TABLE `RetailJobListings` (
`ListingID` int(11)
,`CompanyID` int(11)
,`Title` varchar(255)
,`Description` text
,`Salary` decimal(10,2)
,`ContractTypeID` int(11)
,`SectorID` int(11)
,`StreetAddress` varchar(255)
,`City` varchar(100)
,`PostCode` varchar(20)
,`PostDate` date
);

-- --------------------------------------------------------

--
-- Table structure for table `Sectors`
--

CREATE TABLE `Sectors` (
  `SectorID` int(11) NOT NULL,
  `SectorName` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Sectors`
--

INSERT INTO `Sectors` (`SectorID`, `SectorName`) VALUES
(1, 'Tech'),
(2, 'Finance'),
(3, 'HR'),
(4, 'Public Sector'),
(5, 'Executive'),
(6, 'Built Environment'),
(7, 'Business Support'),
(8, 'Sales & Marketing'),
(9, 'Supply Chain and Logistics'),
(10, 'Engineering & Manufacturing'),
(11, 'Science'),
(12, 'Legal'),
(13, 'Other'),
(14, 'Food Service'),
(15, 'Transportation'),
(16, 'Retail'),
(17, 'Hospitality');

-- --------------------------------------------------------

--
-- Table structure for table `Skills`
--

CREATE TABLE `Skills` (
  `SkillID` int(11) NOT NULL,
  `SkillName` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Skills`
--

INSERT INTO `Skills` (`SkillID`, `SkillName`) VALUES
(1, 'Public speaking'),
(2, 'Team Player'),
(3, 'Computer Skills'),
(4, 'Web design'),
(5, 'Graphic design'),
(6, 'Patience'),
(7, 'Problem-Solving'),
(8, 'Team Management'),
(9, 'Leadership'),
(10, 'Java Programmer'),
(11, 'SQL Programmer'),
(12, 'Python Programmer'),
(13, 'Cloud Computing'),
(14, 'Creativity'),
(15, 'Time Management'),
(16, 'Critical Thinking'),
(17, 'Project Management'),
(18, 'Drawing'),
(19, 'Painting'),
(20, 'Fluent in English'),
(21, 'Fluent in Spanish'),
(22, 'Fluent in French'),
(23, 'Fluent in Mandarin'),
(24, 'Fluent in Arabic'),
(25, 'Fluent in Russian'),
(26, 'Fluent in Japanese'),
(27, 'Attention to Detail'),
(28, 'Sales Skills'),
(29, 'Database Management'),
(30, 'Social Media Management'),
(31, 'Communication Skills'),
(32, 'Quality Assurance'),
(33, 'Adaptability'),
(34, 'Interpersonal Skills'),
(35, 'Work Ethic'),
(36, 'Storytelling'),
(37, 'Negotiation'),
(38, 'Fast Typing'),
(39, 'Commitment'),
(40, 'Restaurant experience'),
(41, 'Hospitality'),
(42, 'Serving'),
(43, 'Barista experience'),
(44, 'Merchandising'),
(45, 'Customer service'),
(46, 'Organisational skills'),
(47, 'Administrative experience'),
(48, 'Food Hygiene Certificate'),
(49, 'Fashion retail'),
(50, 'Horticulture'),
(51, 'Microsoft Office'),
(52, 'Direct sales');

-- --------------------------------------------------------

--
-- Structure for view `AllJobListingsFrom14DaysAgo`
--
DROP TABLE IF EXISTS `AllJobListingsFrom14DaysAgo`;

CREATE ALGORITHM=UNDEFINED DEFINER=`cmccartney29`@`localhost` SQL SECURITY DEFINER VIEW `AllJobListingsFrom14DaysAgo`  AS SELECT `JobListings`.`ListingID` AS `ListingID`, `JobListings`.`CompanyID` AS `CompanyID`, `JobListings`.`Title` AS `Title`, `JobListings`.`Description` AS `Description`, `JobListings`.`Salary` AS `Salary`, `JobListings`.`ContractTypeID` AS `ContractTypeID`, `JobListings`.`SectorID` AS `SectorID`, `JobListings`.`StreetAddress` AS `StreetAddress`, `JobListings`.`City` AS `City`, `JobListings`.`PostCode` AS `PostCode`, `JobListings`.`PostDate` AS `PostDate` FROM `JobListings` WHERE `JobListings`.`PostDate` >= curdate() - interval 14 day ;

-- --------------------------------------------------------

--
-- Structure for view `CompanyAverageSalaryForJobListings`
--
DROP TABLE IF EXISTS `CompanyAverageSalaryForJobListings`;

CREATE ALGORITHM=UNDEFINED DEFINER=`cmccartney29`@`localhost` SQL SECURITY DEFINER VIEW `CompanyAverageSalaryForJobListings`  AS SELECT `c`.`CompanyID` AS `CompanyID`, `c`.`CompanyName` AS `CompanyName`, count(`jl`.`ListingID`) AS `TotalListings`, avg(`jl`.`Salary`) AS `AverageSalary` FROM (`Company` `c` join `JobListings` `jl` on(`c`.`CompanyID` = `jl`.`CompanyID`)) GROUP BY `c`.`CompanyID` ORDER BY count(`jl`.`ListingID`) DESC, avg(`jl`.`Salary`) DESC ;

-- --------------------------------------------------------

--
-- Structure for view `JobsCurrentlyAppliedFor`
--
DROP TABLE IF EXISTS `JobsCurrentlyAppliedFor`;

CREATE ALGORITHM=UNDEFINED DEFINER=`cmccartney29`@`localhost` SQL SECURITY DEFINER VIEW `JobsCurrentlyAppliedFor`  AS SELECT `jl`.`ListingID` AS `ListingID`, `jl`.`Title` AS `JobTitle`, `a`.`ApplicationID` AS `ApplicationID`, `js`.`Forename` AS `ApplicantForename`, `js`.`Surname` AS `ApplicantSurname`, `a`.`ApplicationDate` AS `ApplicationDate`, `s`.`StatusName` AS `ApplicationStatus` FROM (((`JobListings` `jl` join `Applications` `a` on(`jl`.`ListingID` = `a`.`JobListingID`)) join `JobSeekers` `js` on(`a`.`JobSeekerCVID` = `js`.`JobSeekerID`)) join `ApplicationStatus` `s` on(`a`.`ApplicationStatusID` = `s`.`StatusID`)) ORDER BY `jl`.`ListingID` ASC, `a`.`ApplicationDate` ASC ;

-- --------------------------------------------------------

--
-- Structure for view `RetailJobListings`
--
DROP TABLE IF EXISTS `RetailJobListings`;

CREATE ALGORITHM=UNDEFINED DEFINER=`cmccartney29`@`localhost` SQL SECURITY DEFINER VIEW `RetailJobListings`  AS SELECT `JobListings`.`ListingID` AS `ListingID`, `JobListings`.`CompanyID` AS `CompanyID`, `JobListings`.`Title` AS `Title`, `JobListings`.`Description` AS `Description`, `JobListings`.`Salary` AS `Salary`, `JobListings`.`ContractTypeID` AS `ContractTypeID`, `JobListings`.`SectorID` AS `SectorID`, `JobListings`.`StreetAddress` AS `StreetAddress`, `JobListings`.`City` AS `City`, `JobListings`.`PostCode` AS `PostCode`, `JobListings`.`PostDate` AS `PostDate` FROM `JobListings` WHERE `JobListings`.`SectorID` = (select `Sectors`.`SectorID` from `Sectors` where `Sectors`.`SectorName` = 'Retail') ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Applications`
--
ALTER TABLE `Applications`
  ADD PRIMARY KEY (`ApplicationID`),
  ADD KEY `JobSeekerCVID_Index` (`JobSeekerCVID`),
  ADD KEY `JobListingID` (`JobListingID`),
  ADD KEY `ApplicationStatusID_Index` (`ApplicationStatusID`);

--
-- Indexes for table `ApplicationStatus`
--
ALTER TABLE `ApplicationStatus`
  ADD PRIMARY KEY (`StatusID`);

--
-- Indexes for table `Company`
--
ALTER TABLE `Company`
  ADD PRIMARY KEY (`CompanyID`);

--
-- Indexes for table `ContractTypes`
--
ALTER TABLE `ContractTypes`
  ADD PRIMARY KEY (`ContractTypeID`);

--
-- Indexes for table `JobListings`
--
ALTER TABLE `JobListings`
  ADD PRIMARY KEY (`ListingID`),
  ADD KEY `CompanyID_Index` (`CompanyID`),
  ADD KEY `Title_Index` (`Title`),
  ADD KEY `ContractTypeID_Index` (`ContractTypeID`),
  ADD KEY `SectorID_Index` (`SectorID`);

--
-- Indexes for table `JobListingSkills`
--
ALTER TABLE `JobListingSkills`
  ADD PRIMARY KEY (`JobListingID`,`SkillID`),
  ADD KEY `JobListingID_Index` (`JobListingID`),
  ADD KEY `SkillID_Index` (`SkillID`);

--
-- Indexes for table `JobSeekerCV`
--
ALTER TABLE `JobSeekerCV`
  ADD PRIMARY KEY (`CV_ID`),
  ADD KEY `JobSeekerID_Index` (`JobSeekerID`);

--
-- Indexes for table `JobSeekers`
--
ALTER TABLE `JobSeekers`
  ADD PRIMARY KEY (`JobSeekerID`);

--
-- Indexes for table `JobSeekerSkills`
--
ALTER TABLE `JobSeekerSkills`
  ADD PRIMARY KEY (`SeekerID`,`SkillID`),
  ADD KEY `SkillID_Index` (`SkillID`);

--
-- Indexes for table `Sectors`
--
ALTER TABLE `Sectors`
  ADD PRIMARY KEY (`SectorID`);

--
-- Indexes for table `Skills`
--
ALTER TABLE `Skills`
  ADD PRIMARY KEY (`SkillID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `Applications`
--
ALTER TABLE `Applications`
  MODIFY `ApplicationID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `ApplicationStatus`
--
ALTER TABLE `ApplicationStatus`
  MODIFY `StatusID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `Company`
--
ALTER TABLE `Company`
  MODIFY `CompanyID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT for table `ContractTypes`
--
ALTER TABLE `ContractTypes`
  MODIFY `ContractTypeID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `JobListings`
--
ALTER TABLE `JobListings`
  MODIFY `ListingID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `JobSeekerCV`
--
ALTER TABLE `JobSeekerCV`
  MODIFY `CV_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `JobSeekers`
--
ALTER TABLE `JobSeekers`
  MODIFY `JobSeekerID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT for table `Sectors`
--
ALTER TABLE `Sectors`
  MODIFY `SectorID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `Skills`
--
ALTER TABLE `Skills`
  MODIFY `SkillID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `Applications`
--
ALTER TABLE `Applications`
  ADD CONSTRAINT `Applications_ibfk_1` FOREIGN KEY (`JobSeekerCVID`) REFERENCES `JobSeekerCV` (`CV_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `Applications_ibfk_2` FOREIGN KEY (`JobListingID`) REFERENCES `JobListings` (`ListingID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `Applications_ibfk_3` FOREIGN KEY (`ApplicationStatusID`) REFERENCES `ApplicationStatus` (`StatusID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `JobListings`
--
ALTER TABLE `JobListings`
  ADD CONSTRAINT `JobListings_ibfk_1` FOREIGN KEY (`CompanyID`) REFERENCES `Company` (`CompanyID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `JobListings_ibfk_2` FOREIGN KEY (`ContractTypeID`) REFERENCES `ContractTypes` (`ContractTypeID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `JobListings_ibfk_3` FOREIGN KEY (`SectorID`) REFERENCES `Sectors` (`SectorID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `JobListingSkills`
--
ALTER TABLE `JobListingSkills`
  ADD CONSTRAINT `JobListingSkills_ibfk_1` FOREIGN KEY (`JobListingID`) REFERENCES `JobListings` (`ListingID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `JobListingSkills_ibfk_2` FOREIGN KEY (`SkillID`) REFERENCES `Skills` (`SkillID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `JobSeekerCV`
--
ALTER TABLE `JobSeekerCV`
  ADD CONSTRAINT `JobSeekerCV_ibfk_1` FOREIGN KEY (`JobSeekerID`) REFERENCES `JobSeekers` (`JobSeekerID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `JobSeekerSkills`
--
ALTER TABLE `JobSeekerSkills`
  ADD CONSTRAINT `JobSeekerSkills_ibfk_1` FOREIGN KEY (`SeekerID`) REFERENCES `JobSeekers` (`JobSeekerID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `JobSeekerSkills_ibfk_2` FOREIGN KEY (`SkillID`) REFERENCES `Skills` (`SkillID`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
