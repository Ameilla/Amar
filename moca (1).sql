-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Mar 07, 2024 at 07:31 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `moca`
--

-- --------------------------------------------------------

--
-- Table structure for table `doctor_page`
--

CREATE TABLE `doctor_page` (
  `doctor_id` int(11) NOT NULL,
  `doctor_name` text NOT NULL,
  `doctor_email` text NOT NULL,
  `doctor_password` text NOT NULL,
  `doctor_designation` text NOT NULL,
  `doctor_img` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `doctor_page`
--

INSERT INTO `doctor_page` (`doctor_id`, `doctor_name`, `doctor_email`, `doctor_password`, `doctor_designation`, `doctor_img`) VALUES
(0, 'ameilla', '123@gmail.com', '123', 'medicine', 'uploads/806ACC75-4044-4379-8799-6FB17F770ADF.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `p_details`
--

CREATE TABLE `p_details` (
  `id` int(11) NOT NULL,
  `Name` text NOT NULL,
  `Age` int(11) NOT NULL,
  `Gender` text NOT NULL,
  `phone_no` text NOT NULL,
  `alter_ph_no` text NOT NULL,
  `patient_img` text NOT NULL,
  `Diagnosis` text NOT NULL,
  `Drug` text NOT NULL,
  `hippocampal` text NOT NULL,
  `mri_before` text NOT NULL,
  `mri_after` text NOT NULL,
  `Discription` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `p_details`
--

INSERT INTO `p_details` (`id`, `Name`, `Age`, `Gender`, `phone_no`, `alter_ph_no`, `patient_img`, `Diagnosis`, `Drug`, `hippocampal`, `mri_before`, `mri_after`, `Discription`) VALUES
(262, 'Amarilla', 25, 'Female', '7337207416', '7337207416', 'uploads/D5764D5B-5F77-41D5-89C6-D6D910F53C26.jpg', 'Diagnosis', 'Morphine', 'Hippo', 'uploads/8FAC6720-8971-4F33-B341-5C7E44E52E73.jpg', 'uploads/E6133F48-932D-426F-9493-7C80D61A3306.jpg', 'Nice Amar'),
(263, 'Moni', 21, 'Female', '9949', '7379', 'uploads/8771BC5E-A544-4095-AC01-0A51FD6CD3F1.jpg', 'None', 'None', 'None', 'uploads/EF7EFF4B-7271-47F2-A289-ED855F3B71A6.jpg', 'uploads/D18F7547-DC53-4D46-9A28-A00141D25946.jpg', 'Nice Drawn'),
(264, 'Pavan', 25, 'Male', '7333', '7333', 'uploads/059F83D1-56F5-4857-A679-66BE1CD880BD.jpg', 'Med', 'Morphine', 'hippo', 'uploads/98E9B86B-5239-42FD-AD24-D901D897F411.jpg', 'uploads/9C76C89E-56C2-419A-903D-6EA2A45C5017.jpg', ''),
(266, 'Lineeeeee', 25, 'male', 'dasda', 'sfsd', 'uploads/WhatsApp Image 2023-11-07 at 10.35.40 PM.jpeg', 'dsadas', 'dssadada', 'dasdas', 'uploads/9974CEB8-CBC7-4E9E-96B9-7E31161CAC68.jpg', 'uploads/FC635B6E-B08A-40A0-9288-8E9EE62D88C1.jpg', 'Good'),
(267, 'Eswar', 24, 'male', 'ddssssds', 'dsds', 'uploads/5D59648A-D31D-4AAB-A5AE-9602F05071CB.jpg', 'dad', 'dadad', 'sdsadad', 'uploads/th.png', 'uploads/th.png', ''),
(279, 'Doctor', 12, 'Male', '7337307462', '7337307462', 'uploads/802AE7E5-4A37-4299-9B1E-4813A7639EB0.jpg', 'Diag', 'Drug', '24', 'uploads/8B5931C0-BD57-4A4B-BD5D-E95314304B31.jpg', 'uploads/C5D91379-3F8A-43D8-92D7-522FF5D2DB95.jpg', ''),
(281, 'AMARILLA', 24, 'male', '', '733', 'uploads/5c0264b219d4258d8f7e63c6489eed67.jpg', '733', '733', '733', 'uploads/8797697c2677377433f186a778fae5b3.jpg', 'uploads/1CAE29EE-18CE-4C83-B453-D86157A61A2A.jpg', ''),
(285, 'Geetha', 23, 'male', '4423', '442342', 'uploads/D4FF529F-58EF-4644-89E3-90B02C1FA7B3.jpg', 'Assad', 'dadas', 'dadas', 'uploads/A98BFDC5-5EE4-4041-9F30-5A11961640B9.jpg', '', ''),
(286, 'Amarillo', 23, 'Male', '32312321', '32131231', 'uploads/1C53B1E2-9A77-45CD-9129-F3FC37BE9974.jpg', 'diag', '4324', 'hippo', 'uploads/8261C04D-4D8A-4C6D-825A-5323A5B03381.jpg', 'uploads/E92EFC47-0B9F-4CA2-982B-78E7C4637AD5.jpg', ''),
(287, 'Amar DWARAKACHERLA ', 23, 'Male', '7337207416', '7337207416', 'uploads/0A6DCDD0-3EF5-4CA8-81D1-DC22FCAAC698.jpg', 'Diag', 'None', '23', 'uploads/09B221A7-B4A9-4F75-B2F4-18482104F08D.jpg', 'uploads/94EB1CE1-D333-4532-8267-62043A158290.jpg', 'nice Work'),
(288, 'muni', 23, 'male', '733720', '7333', 'uploads/F03815E9-581E-469F-AB1B-121D69920D5E.jpg', 'diag', 'drug', 'hi', 'uploads/3FE8007A-D8AE-4BAA-8A7E-72AC2F3426BC.jpg', '', ''),
(289, 'Sharath', 23, 'Male', '23123', '321321', 'uploads/5E8AAA8A-A742-4397-94A2-AB1631EC23DD.jpg', 'Diabatic', 'Anat', '1', 'uploads/44D069D4-9903-4F11-944D-16EF77F5BD59.jpg', '', 'Nice');

-- --------------------------------------------------------

--
-- Table structure for table `questions`
--

CREATE TABLE `questions` (
  `id` int(11) NOT NULL,
  `type` text NOT NULL,
  `ques` text NOT NULL,
  `ques_content` text NOT NULL,
  `option1` text NOT NULL,
  `option2` text NOT NULL,
  `option3` text NOT NULL,
  `option4` text NOT NULL,
  `answer` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `questions`
--

INSERT INTO `questions` (`id`, `type`, `ques`, `ques_content`, `option1`, `option2`, `option3`, `option4`, `answer`) VALUES
(1, 'VISUOSPATIAL/EXECUTIVE', 'Choose in a Specific Order\r\n', '', '2 3 1 4 5', '1 4 3 2 5', '1 2 3 4 5', '5 4 3 2 1', '1 2 3 4 5'),
(2, 'VISUOSPATIAL/EXECUTIVE\r\n', 'Draw the Image given Below', 'uploads/th.png', 'A', 'B', 'C', 'D', 'D'),
(3, 'VISUOSPATIAL/EXECUTIVE\r\n', 'Draw the Clock', '', '', '', '', '', ''),
(4, 'NAMING', 'Find the name of the given image', 'uploads/camel.png', 'LION', 'TIGER', 'CAMEL', 'ZEBRA', 'CAMEL'),
(5, 'MEMORY', 'Find the Church from the Below Images\r\n', '', 'uploads/mosque.jpeg', 'uploads/tq.jpeg', 'uploads/temple.jpeg', 'uploads/church.jpeg', '4'),
(6, 'ATTENTION', 'Find the missing number from the sequence', '1  2  3  _  5', '3', '4', '5', 'None of the above', '4'),
(7, 'ATTENTION', 'Keep the Letters in a Ascending order sequence', 'E  D  B  C  A', 'A  B  C  E  D', 'E  D  C  B  A', 'A  B  C  D  E', 'B C A D E', 'A  B  C  D  E'),
(8, 'LANGUAGE', 'Find the language of the sentence given below', 'நம் நாட்டின் பரத்', 'TELUGU', 'HINDI', 'TAMIL', 'ENGLISH', 'TAMIL'),
(9, 'ABSTRACTION', 'Find the similarity between Images', 'uploads/fruits.png', 'Vegetables', 'Fruits', 'Vehicles', 'None of these', 'Fruits'),
(10, 'ORIENTATION', 'How many Months in a Year', '', '1', '12', '11', '5', '12');

-- --------------------------------------------------------

--
-- Table structure for table `results`
--

CREATE TABLE `results` (
  `id` int(11) NOT NULL,
  `task1` int(11) NOT NULL,
  `task2` int(11) NOT NULL,
  `task3` int(11) NOT NULL,
  `task4` int(11) NOT NULL,
  `task5` int(11) NOT NULL,
  `task6` int(11) NOT NULL,
  `task7` int(11) NOT NULL,
  `image1` text NOT NULL,
  `image2` text NOT NULL,
  `result` int(11) NOT NULL,
  `interpretation` text NOT NULL,
  `submission_datetime` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `Discription` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `results`
--

INSERT INTO `results` (`id`, `task1`, `task2`, `task3`, `task4`, `task5`, `task6`, `task7`, `image1`, `image2`, `result`, `interpretation`, `submission_datetime`, `Discription`) VALUES
(262, 0, 0, 1, 1, 1, 0, 1, 'uploads/1EB2826B-E714-46D4-9FD5-3B83527B25A5.jpg', 'uploads/C34A9330-78D1-4BAD-B196-3552973C876F.jpg', 0, '', '2023-12-08 19:31:02', 'Nice'),
(263, 0, 0, 1, 1, 1, 1, 1, 'uploads/23BBF80C-49C4-43B2-B56D-7C4A7539B349.jpg', 'uploads/C0B87D7D-863A-4DD0-86F9-2359DD627BCA.jpg', 0, '', '2023-11-26 08:27:24', ''),
(263, 0, 0, 1, 2, 1, 2, 1, 'uploads/F650CD3F-0491-44C4-B584-6978CE904362.jpg', 'uploads/73AE666B-EC86-44B1-B940-ED84020528F8.jpg', 0, '', '2023-11-26 08:38:49', ''),
(263, 0, 0, 1, 2, 1, 2, 1, 'uploads/08CD05E2-404C-4866-918C-B4B34A689CFE.jpg', 'uploads/6EBED8ED-0034-4227-9871-99902E7EEAE7.jpg', 0, '', '2023-11-26 08:45:28', ''),
(262, 0, 0, 1, 2, 1, 1, 1, 'uploads/6D913CEE-6506-4C04-B6F1-46BF0D313821.jpg', 'uploads/798AB829-5228-41C8-93EB-10785C336FA9.jpg', 1, '', '2023-12-08 19:31:02', 'Nice'),
(262, 0, 0, 1, 2, 1, 1, 1, 'uploads/47106821-C402-4479-B988-315D86D62FBE.jpg', 'uploads/E87BFAEF-3354-4B26-93DD-619DF2945D47.jpg', 1, '', '2023-12-08 19:31:02', 'Nice'),
(262, 0, 0, 1, 2, 1, 1, 1, 'uploads/AC43E753-8DF2-41BC-A465-8BD8B14204A9.jpg', 'uploads/8471354F-E31E-4EB1-82B9-A455A6D18D1E.jpg', 1, '', '2023-12-08 19:31:02', 'Nice'),
(262, 0, 0, 1, 2, 1, 1, 1, 'uploads/4419B502-B0B8-4ED2-AF24-3F9E3EF924F6.jpg', 'uploads/F497713B-0B66-4A3D-95EE-8B88799D5A4E.jpg', 1, '', '2023-12-08 19:31:02', 'Nice'),
(263, 0, 0, 1, 2, 1, 1, 1, 'uploads/CD68F0EE-C7A4-402B-86AF-D7DCDB4CD371.jpg', 'uploads/78581C6F-3F36-4E35-949C-291400FCECBE.jpg', 1, '', '2023-11-26 09:08:49', ''),
(262, 0, 0, 1, 2, 1, 1, 0, 'uploads/14EB14A7-D81A-4CF9-A344-E2B2034B7408.jpg', 'uploads/92BE7AF9-45EA-4DC6-A332-0292BF1DA0CB.jpg', 0, '', '2023-12-08 19:31:02', 'Nice'),
(262, 0, 0, 1, 2, 1, 1, 0, 'uploads/B4E1BCCA-7971-418C-8C3B-3D0CF9332EEA.jpg', 'uploads/2A5A1972-B2D9-44D7-AF81-7B4F0C411E10.jpg', 0, '', '2023-12-08 19:31:02', 'Nice'),
(262, 0, 0, 1, 2, 1, 1, 0, 'uploads/E9A794AF-1CA2-47CC-B368-40F7CB12857E.jpg', 'uploads/D3F769C1-AEB9-44C1-9CA1-871DB996D94F.jpg', 0, '', '2023-12-08 19:31:02', 'Nice'),
(262, 0, 0, 1, 2, 1, 1, 1, 'uploads/CFE0F3B5-413B-4183-A60D-D2D71AA92E8C.jpg', 'uploads/86610474-5FAB-40F1-BC96-0A086F58B793.jpg', 1, '', '2023-12-08 19:31:02', 'Nice'),
(262, 0, 0, 1, 2, 1, 1, 1, 'uploads/D2FDF16C-55E3-47BB-94B6-76C0DABEB225.jpg', 'uploads/D29AB338-D1D1-4D1B-996C-C439B171C2E7.jpg', 6, '', '2023-12-08 19:31:02', 'Nice'),
(262, 0, 0, 1, 2, 1, 1, 1, 'uploads/51439286-B4BC-4027-A669-C2895604B9E7.jpg', 'uploads/3078CA30-B73F-4782-95A2-FED832AE4A6D.jpg', 6, '', '2023-12-08 19:31:02', 'Nice'),
(262, 1, 1, 1, 2, 1, 1, 1, 'uploads/EDB588EF-8A01-48F9-B66A-C12B11F0B294.jpg', 'uploads/CB58AC57-8E4C-468C-AF0C-6309F9439535.jpg', 8, '', '2023-12-08 19:31:02', 'Nice'),
(262, 1, 1, 1, 2, 1, 1, 1, 'uploads/5EB86D28-C883-4E15-A295-542A1A3C3A3A.jpg', 'uploads/9CBE002D-884A-45AB-8783-EBF0E202FF97.jpg', 8, '', '2023-12-08 19:31:02', 'Nice'),
(262, 1, 1, 1, 2, 1, 1, 1, 'uploads/CBCB3132-DE7F-4410-94D7-4EA2AF8618F2.jpg', 'uploads/088643E7-825D-474A-B71F-76D81B7AD941.jpg', 8, '', '2023-12-08 19:31:02', 'Nice'),
(262, 1, 1, 1, 2, 1, 1, 1, 'uploads/5BA5E371-3C3A-4F60-98F0-97F9C83D6B5D.jpg', 'uploads/8366C8C9-A7C0-4474-BDE9-81954692F003.jpg', 8, '', '2023-12-08 19:31:02', 'Nice'),
(262, 1, 1, 1, 2, 1, 1, 1, 'uploads/7921501B-EC75-4DB7-94FF-08D3C7B0F935.jpg', 'uploads/7E5EC377-A986-4A2B-B047-6BA2CF629137.jpg', 8, '', '2023-12-08 19:31:02', 'Nice'),
(263, 0, 0, 2, 1, 1, 1, 1, 'uploads/FB69336A-DF54-4017-8D25-2E78D03CC7A3.jpg', 'uploads/2DF8D3F4-E32A-4890-B5B7-5A65D0EB2A8A.jpg', 6, '', '2023-11-26 11:04:49', ''),
(263, 0, 0, 1, 1, 1, 1, 1, 'uploads/49AD030B-9A90-4BE6-8F6E-F5382D706D69.jpg', 'uploads/0D075C6F-FA89-4631-BC25-397287DD9094.jpg', 5, '', '2023-11-26 11:10:29', ''),
(262, 0, 0, 1, 2, 1, 1, 1, 'uploads/5F18B458-80D1-47DD-93E2-8E06F16394BF.jpg', 'uploads/71A496BD-FBDC-411B-A579-179607F0275E.jpg', 6, '', '2023-12-08 19:31:02', 'Nice'),
(263, 1, 1, 1, 2, 1, 1, 1, 'uploads/22FD53BD-B695-439A-86A9-1E24CEFA095B.jpg', 'uploads/8F401550-DB11-4C87-BE52-7AA3C84E401C.jpg', 8, '', '2023-12-03 01:25:28', ''),
(264, 0, 0, 1, 1, 0, 1, 1, 'uploads/035CE8DF-480A-4E87-892D-DC0E09FED499.jpg', 'uploads/3322FEC0-AE58-454F-A7AF-14BB5982EFBA.jpg', 4, '', '2023-12-03 12:41:54', ''),
(262, 1, 0, 1, 2, 1, 1, 1, 'uploads/09CC88BD-2F29-4175-B701-2FA8CF823142.jpg', 'uploads/75CF3C9D-2226-404F-8194-6EFD4F22C926.jpg', 7, '', '2023-12-08 19:31:02', 'Nice'),
(264, 1, 0, 1, 2, 1, 1, 1, 'uploads/698484F4-2356-4020-AB52-CE553A01BE0A.jpg', 'uploads/E678047D-6342-4A89-B1A2-A8C3451E8AF2.jpg', 7, '', '2023-12-07 13:40:07', ''),
(262, 0, 1, 1, 2, 1, 1, 1, 'uploads/971D6A04-F8F4-4FB9-90AF-EB0572A8E440.jpg', 'uploads/CA4E4924-17A0-404D-B83D-B6605D501FA3.jpg', 7, '', '2023-12-08 19:31:02', 'Nice'),
(262, 1, 1, 1, 2, 1, 1, 1, 'uploads/86C86BEF-77F0-457E-97DB-5A46BF4A4640.jpg', 'uploads/A6B810A1-D00B-4A5A-8467-07C422D7DAF8.jpg', 8, '', '2023-12-08 19:31:02', 'Nice'),
(262, 0, 1, 1, 2, 1, 1, 1, 'uploads/8A704C9C-9A95-4B21-930C-169E36C7148A.jpg', 'uploads/9CD0F459-5D72-4FC2-91AE-35A09AC06E48.jpg', 7, '', '2023-12-08 19:31:02', 'Nice'),
(268, 0, 1, 1, 1, 1, 1, 1, 'uploads/848EED41-A63D-493E-A555-A24ACD504BE8.jpg', 'uploads/E674EE3F-FE05-4D2D-B7F6-3CB6F9DCEF3C.jpg', 6, '', '2023-12-07 14:27:06', ''),
(262, 0, 1, 1, 0, 1, 0, 1, 'uploads/170F717D-6708-4FA0-9909-F79DE763FCA9.jpg', 'uploads/3F91B505-26F0-45A5-8470-0CA27C204403.jpg', 4, '', '2023-12-08 19:31:02', 'Nice'),
(273, 1, 0, 1, 1, 1, 0, 0, 'uploads/CEA93CD6-5455-49CC-955D-A01EB4F8E324.jpg', 'uploads/C539CD2D-A145-4193-8B77-FE13AE0241FB.jpg', 4, '', '2023-12-08 00:53:13', ''),
(262, 0, 1, 1, 1, 1, 1, 0, 'uploads/155E660D-11E2-4E5D-807D-0317A3A22D53.jpg', 'uploads/F51DD4C3-0CF2-4F77-A6CB-B6C527A36D4C.jpg', 5, '', '2023-12-08 19:31:02', 'Nice'),
(273, 0, 1, 1, 2, 1, 1, 1, 'uploads/4E996786-DA8C-4644-BA81-90C00EE26C9B.jpg', 'uploads/1E2A05BE-DBE2-4D95-819A-E6E128E1A78A.jpg', 7, '', '2023-12-08 13:30:29', ''),
(262, 1, 1, 1, 2, 1, 1, 1, 'uploads/49855DCC-7AF1-4FB4-8AE9-FEC4F9A54B4B.jpg', 'uploads/560E1BC7-5AF0-40C1-87CC-9EA7ACFCA399.jpg', 8, '', '2023-12-08 19:31:02', 'Nice'),
(263, 0, 1, 1, 2, 1, 1, 1, 'uploads/8331AA9E-DBB9-40ED-9940-090997367BF7.jpg', 'uploads/DBC28C72-8D1E-4E01-87D8-33C4197049B9.jpg', 7, '', '2023-12-08 13:46:53', ''),
(266, 0, 0, 1, 1, 1, 1, 1, 'uploads/AA30B6EA-F37F-4CCD-B7B1-F86432E854C4.jpg', 'uploads/C5E891F1-5E54-468B-8C43-191DD0BB6035.jpg', 5, '', '2023-12-08 19:26:18', 'Good '),
(266, 0, 1, 1, 2, 1, 1, 1, 'uploads/D149BDB1-E13E-47F1-9C23-2106F2D707B6.jpg', 'uploads/8F9EBB58-43E0-417F-9F73-7FC2B2A3C903.jpg', 7, 'Severe Cognitive impairment', '2023-12-08 19:26:18', 'Good '),
(266, 0, 1, 1, 2, 1, 1, 1, 'uploads/9F4C17F4-0A70-49D1-A3A2-7E61DF6F168C.jpg', 'uploads/E834074D-1027-4220-8B6F-398190A4896E.jpg', 7, 'Normal Cognitive', '2023-12-08 19:26:18', 'Good '),
(266, 0, 1, 1, 2, 1, 1, 1, 'uploads/BA4A0BB3-5D49-4063-B11A-1F367F377255.jpg', 'uploads/1321CC5F-8098-46E4-BAE2-E5816B45E313.jpg', 7, 'Normal Cognitive', '2023-12-08 19:26:18', 'Good '),
(266, 0, 0, 1, 1, 1, 1, 1, 'uploads/22775C32-479E-4FDC-AF16-D7B06929ECB9.jpg', 'uploads/62903D19-05A3-4009-80BC-CEE999926FF0.jpg', 5, 'Mild Cognitive impairment', '2023-12-08 19:26:18', 'Good '),
(263, 1, 1, 1, 2, 1, 1, 1, 'uploads/BF7D536F-2B6B-48EC-9067-354A2D1A2E9F.jpg', 'uploads/84CE9322-A5EC-446D-B446-EB7BF9C006CC.jpg', 8, 'Normal Cognitive', '2023-12-09 01:15:23', ''),
(263, 1, 1, 1, 2, 1, 1, 1, 'uploads/3BA91B51-3EEF-4EE0-8FDA-EA34F0148FD6.jpg', 'uploads/11E6BF9F-A069-444C-BF87-1750B92A839C.jpg', 8, 'Normal Cognitive', '2023-12-09 01:19:28', ''),
(263, 1, 1, 1, 2, 1, 1, 1, 'uploads/43C6F0F3-0473-410D-9153-618666E618B3.jpg', 'uploads/2ADBE1AA-B506-4F40-96BD-9429718CC92A.jpg', 8, 'Normal Cognitive', '2023-12-09 04:28:43', ''),
(266, 1, 1, 1, 2, 1, 1, 1, 'uploads/D27A9D4D-C7C4-4E96-97DB-766EEEFFA57A.jpg', 'uploads/AE04470E-F7C5-4D77-A80E-87626740DC25.jpg', 8, 'Normal Cognitive', '2023-12-09 04:39:32', ''),
(272, 1, 1, 1, 2, 1, 1, 1, 'uploads/A32BDDD5-B493-4487-9366-47E018E0468A.jpg', 'uploads/D29348B0-A80C-4B18-8B87-3957337A0CD1.jpg', 8, 'Normal Cognitive', '2023-12-10 08:27:51', ''),
(263, 1, 1, 1, 2, 1, 1, 1, 'uploads/CD918B91-9F94-478C-9519-038305B7B9A3.jpg', 'uploads/80AA8508-AEBD-41C9-9DE0-A9011BA51186.jpg', 8, 'Normal Cognitive', '2023-12-10 09:32:03', ''),
(266, 1, 0, 1, 2, 1, 1, 1, 'uploads/4A4C19BF-2193-41B8-9037-663D77D18952.jpg', 'uploads/16165400-81E7-417E-A4DD-03F69CC56F2A.jpg', 7, 'Normal Cognitive', '2023-12-10 09:40:57', ''),
(262, 1, 1, 1, 2, 1, 1, 1, 'uploads/123F5F78-6C1A-43A9-80F7-1692BB86A7ED.jpg', 'uploads/822886B8-B476-4540-84A6-9BC29AF49707.jpg', 8, 'Normal Cognitive', '2023-12-11 04:53:52', ''),
(263, 0, 1, 1, 2, 1, 0, 1, 'uploads/5199C62C-DE45-4B73-AAB3-4B5199C2DE31.jpg', 'uploads/9E84FF59-E827-4C0E-BE6E-443B87B08F39.jpg', 6, 'Mild Cognitive impairment', '2023-12-11 05:56:24', ''),
(262, 1, 0, 1, 2, 1, 0, 1, 'uploads/9CA6DC5E-8C13-4931-BB68-7B0DA9AB1603.jpg', 'uploads/5616BD10-1714-4F17-BB68-7FB83B09375D.jpg', 6, 'Mild Cognitive impairment', '2023-12-11 13:45:45', ''),
(262, 1, 0, 1, 2, 1, 1, 1, 'uploads/56E14262-E7FB-44AE-A148-23DC5675687E.jpg', 'uploads/C4E38703-1598-49B0-8EEC-85D4D2A20132.jpg', 7, 'Normal Cognitive', '2023-12-12 04:07:08', ''),
(262, 1, 2, 1, 2, 1, 0, 1, 'uploads/AD0D3309-186F-49F0-8356-C51E44FC569A.jpg', 'uploads/8A301103-21A5-41C7-8C4A-0CE96A8EECC5.jpg', 8, 'Normal Cognitive', '2023-12-13 21:17:41', ''),
(276, 1, 2, 1, 2, 1, 0, 1, 'uploads/509C048E-C989-480B-A732-2FA89F0E7E8D.jpg', 'uploads/CB1279EF-C5CC-40A4-AEBC-2CA0FC27DC64.jpg', 8, 'Normal Cognitive', '2023-12-14 07:19:46', ''),
(277, 1, 1, 1, 2, 1, 0, 0, 'uploads/B7ACCABE-DA2F-426C-82DF-185DA4464347.jpg', 'uploads/4097263B-082F-4801-9F5B-4BC6F3C274F7.jpg', 6, 'Mild Cognitive impairment', '2023-12-30 07:00:10', ''),
(276, 1, 2, 1, 1, 1, 0, 0, 'uploads/C4C60396-0342-4778-92CE-E83C7A31F88B.jpg', 'uploads/3A08D940-74E7-41A9-9BCB-72FDE439E202.jpg', 6, 'Mild Cognitive impairment', '2023-12-30 11:55:26', ''),
(263, 0, 2, 1, 1, 0, 0, 0, 'uploads/C9A6D385-4181-4DDC-B44E-6F58BE7901D9.jpg', 'uploads/4427A6A6-A657-4177-9C27-C9099182A6D6.jpg', 4, 'Moderate Cognitive impairment', '2024-01-08 12:24:51', ''),
(263, 0, 1, 1, 2, 1, 0, 0, 'uploads/91FD1C28-EB57-4515-9457-135BCC026818.jpg', 'uploads/8F6DF880-5C05-4C6E-B5C5-950F176DFEDE.jpg', 5, 'Mild Cognitive impairment', '2024-01-09 12:50:11', ''),
(271, 0, 0, 1, 2, 1, 0, 0, 'uploads/DDE6304A-1965-4E6E-8059-8072F3D1BC40.jpg', 'uploads/E64DCFEB-38BB-4091-8986-914115F435D0.jpg', 4, 'Moderate Cognitive impairment', '2024-01-09 13:03:58', ''),
(262, 0, 1, 1, 2, 1, 1, 1, 'uploads/D54806AD-ECB5-4FC8-9035-4134491F81FC.jpg', 'uploads/9F5C0C6D-F101-4735-BE10-68BEB5ED2400.jpg', 7, 'Normal Cognitive', '2024-02-09 10:57:19', ''),
(262, 1, 1, 1, 2, 1, 1, 1, 'uploads/92632B0C-B8AD-4D55-9689-021D3D32F2D6.jpg', 'uploads/E1B93F34-2157-4767-9377-36F0D9922715.jpg', 8, 'Normal Cognitive', '2024-02-12 19:49:13', ''),
(263, 1, 0, 1, 2, 0, 1, 1, 'uploads/EEDC6394-E9F2-4979-AE6F-8FAFC1905EAB.jpg', 'uploads/E22BE3CA-E09B-4C16-ABE2-214B47D38C51.jpg', 6, 'Mild Cognitive impairment', '2024-02-14 01:01:49', ''),
(266, 1, 0, 1, 1, 0, 0, 1, 'uploads/32D2AEC2-9938-460C-95CA-49B88EEF0FB4.jpg', 'uploads/7E2F8402-B22D-4E5B-A1AC-7C6B97F6D215.jpg', 4, 'Moderate Cognitive impairment', '2024-02-14 01:26:39', ''),
(262, 0, 0, 1, 1, 0, 0, 0, 'uploads/57CA4980-FCE2-4EE8-9872-178E34CC56F6.jpg', 'uploads/982D5ACE-80EC-44AA-BDCE-046F5F4049BB.jpg', 2, 'Severe Cognitive impairment', '2024-02-14 03:45:10', ''),
(262, 0, 0, 1, 1, 0, 0, 0, 'uploads/E4EFDBFD-FA1B-4E02-B704-E51070BA9569.jpg', 'uploads/9BD24AD0-D6D0-410A-B854-DAE991BF38F9.jpg', 2, 'Severe Cognitive impairment', '2024-02-14 04:00:39', ''),
(262, 0, 0, 1, 0, 0, 0, 0, 'uploads/00116772-6353-4D00-ACA3-0E7BEA1B72C8.jpg', 'uploads/4B2D0894-6A74-4798-8F96-9CEFD9961CD5.jpg', 1, 'Severe Cognitive impairment', '2024-02-14 04:07:15', ''),
(262, 0, 0, 1, 0, 0, 0, 0, 'uploads/B67E82D8-4DD4-4A78-9F2E-E894CA2CAF91.jpg', 'uploads/F46C9CC1-B761-45AB-A6FF-6904FBE48F55.jpg', 1, 'Severe Cognitive impairment', '2024-02-14 04:12:52', ''),
(281, 0, 0, 1, 3, 3, 2, 6, 'uploads/094D587E-7104-435D-86F6-D7A9B2FDBB23.jpg', 'uploads/CA6842DD-2D5C-47EF-AB64-19C801569F9F.jpg', 15, 'Severe Cognitive impairment', '2024-02-19 12:26:37', ''),
(266, 5, 3, 1, 6, 3, 2, 6, 'uploads/E7757F24-85B5-46D3-84E3-124AD8E1CC10.jpg', 'uploads/C3318138-4CF6-429F-BC3C-AEEB0A60EC88.jpg', 26, 'Severe Cognitive impairment', '2024-02-19 12:35:22', ''),
(281, 5, 3, 1, 6, 3, 2, 6, 'uploads/4C33F3B3-70B3-43CA-8892-C85B595E760E.jpg', 'uploads/2F3B5E5B-8533-441A-A79F-E6900B4ECCF5.jpg', 26, 'Severe Cognitive impairment', '2024-02-19 12:55:49', ''),
(262, 5, 3, 0, 6, 3, 2, 6, 'uploads/2807BD34-0508-497D-ACC1-55833F294A9B.jpg', 'uploads/2AE54EEE-4143-49D3-B087-4351DAE597CE.jpg', 25, 'Severe Cognitive impairment', '2024-02-19 13:14:01', ''),
(262, 0, 3, 0, 6, 3, 2, 6, 'uploads/8C126503-40EA-4BE4-ABF1-C1FAECC38A41.jpg', 'uploads/614D781B-A578-47C4-B0F0-7D7C6D2A8F41.jpg', 20, 'Severe Cognitive impairment', '2024-02-24 04:41:22', ''),
(281, 5, 3, 0, 6, 3, 2, 6, 'uploads/E202DAC3-2AF4-4397-A9F2-0617B23FD65E.jpg', 'uploads/CC9B0FC8-890B-4185-B3E8-F11104928E48.jpg', 25, 'Severe Cognitive impairment', '2024-02-24 07:37:13', ''),
(281, 5, 3, 5, 6, 3, 2, 6, 'uploads/A71D733F-BDF0-46B4-A097-38D4929E92DB.jpg', 'uploads/CF4FF68D-E2ED-4152-B5FD-3CDF154F401F.jpg', 30, 'Severe Cognitive impairment', '2024-02-24 07:49:39', ''),
(287, 5, 3, 5, 6, 3, 2, 6, 'uploads/BABBEC00-D34A-4287-BAE5-12D8C3376F6B.jpg', 'uploads/40C385A7-A42A-44F3-9AEE-E513BBB12789.jpg', 30, 'Severe Cognitive impairment', '2024-03-03 08:27:01', ''),
(289, 5, 3, 5, 6, 3, 2, 6, 'uploads/E2447267-B813-4005-8B61-85BC5E711392.jpg', 'uploads/4CD95717-CF33-4E0D-AB1D-68C593E4A73A.jpg', 30, 'Severe Cognitive impairment', '2024-03-04 03:42:20', ''),
(264, 5, 3, 5, 6, 3, 2, 6, 'uploads/0577D6D3-D47C-4B50-B682-8FCBB352C77C.jpg', 'uploads/ED18BAE6-718B-4EA3-ABD7-288D9FC620BF.jpg', 30, 'Severe Cognitive impairment', '2024-03-04 03:50:49', ''),
(286, 5, 0, 5, 3, 3, 2, 6, 'uploads/8661112A-3A37-429D-B61A-A6EBEDB116CB.jpg', 'uploads/9B3FAB37-708E-4259-AE1F-419461C60EA8.jpg', 24, 'Severe Cognitive impairment', '2024-03-04 03:56:28', ''),
(289, 5, 0, 5, 6, 0, 2, 6, 'uploads/FE4A3246-29D4-4B1E-9F59-FC10B1140550.jpg', 'uploads/C7303925-A2D2-4178-9533-BB148D8421EB.jpg', 24, 'Severe Cognitive impairment', '2024-03-04 12:32:02', ''),
(287, 5, 0, 5, 6, 0, 2, 6, 'uploads/5C2D92EB-AC4E-4632-BC57-2CB996A640E1.jpg', 'uploads/9FCF7435-B6CA-4DF5-82CA-AAB88E0D93F0.jpg', 24, 'Severe Cognitive impairment', '2024-03-04 12:35:01', '');

-- --------------------------------------------------------

--
-- Table structure for table `tamil`
--

CREATE TABLE `tamil` (
  `id` int(11) NOT NULL,
  `type` text NOT NULL,
  `ques` text NOT NULL,
  `ques_content` text NOT NULL,
  `option1` text NOT NULL,
  `option2` text NOT NULL,
  `option3` text NOT NULL,
  `option4` text NOT NULL,
  `answer` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tamil`
--

INSERT INTO `tamil` (`id`, `type`, `ques`, `ques_content`, `option1`, `option2`, `option3`, `option4`, `answer`) VALUES
(1, 'VISUOSPATIAL/EXECUTIVE', 'ஒரு குறிப்பிட்ட வரிசையில் தேர்வு செய்யவும்\r\n', '', '2 3 1 4 5', '1 4 3 2 5', '1 2 3 4 5', '5 4 3 2 1', '1 2 3 4 5'),
(2, 'VISUOSPATIAL/EXECUTIVE\r\n', 'கீழே கொடுக்கப்பட்டுள்ள படத்தை வரையவும்\r\n', 'uploads/th.png', 'A', 'B', 'C', 'D', 'D'),
(3, 'VISUOSPATIAL/EXECUTIVE\r\n', 'கடிகாரத்தை வரைக', '', '', '', '', '', ''),
(4, 'NAMING', 'கொடுக்கப்பட்ட படத்தின் பெயரைக் கண்டறியவும்', 'uploads/camel.png', 'லயன்', 'புலி', 'ஒட்டகம்', 'ஜீப்ரா', 'ஒட்டகம்'),
(5, 'MEMORY', 'கீழே உள்ள படங்களிலிருந்து தேவாலயத்தைக் கண்டறியவும்', '', 'uploads/mosque.jpeg', 'uploads/tq.jpeg', 'uploads/temple.jpeg', 'uploads/church.jpeg', '4'),
(6, 'ATTENTION', 'வரிசையிலிருந்து விடுபட்ட எண்ணைக் கண்டறியவும்', '1  2  3  _  5', '3', '4', '5', 'மேலே எதுவும் இல்லை', '4'),
(7, 'ATTENTION', 'கடிதங்களை ஏறுவரிசை வரிசையில் வைக்கவும்', 'E  D  B  C  A', 'A  B  C  E  D', 'E  D  C  B  A', 'A  B  C  D  E', 'B C A D E', 'A  B  C  D  E'),
(8, 'LANGUAGE', 'கீழே கொடுக்கப்பட்டுள்ள வாக்கியத்தின் மொழியைக் கண்டறியவும்', 'நம் நாட்டின் பரத்', 'தெலுங்கு', 'ஹிந்தி', 'தமிழ்', 'ஆங்கிலம்', 'தமிழ்'),
(9, 'ABSTRACTION', 'படங்களுக்கு இடையிலான ஒற்றுமையைக் கண்டறியவும்', 'uploads/fruits.png', 'காய்கறிகள்', 'பழங்கள்', 'வாகனங்கள்', 'இவற்றில் ஏதுமில்லை', 'பழங்கள்'),
(10, 'ORIENTATION', 'ஒரு வருடத்தில் எத்தனை மாதங்கள்', '', '1', '12', '11', '5', '12');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `doctor_page`
--
ALTER TABLE `doctor_page`
  ADD PRIMARY KEY (`doctor_id`);

--
-- Indexes for table `p_details`
--
ALTER TABLE `p_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `questions`
--
ALTER TABLE `questions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tamil`
--
ALTER TABLE `tamil`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `p_details`
--
ALTER TABLE `p_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=290;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
