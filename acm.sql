DROP DATABASE IF EXISTS GSUACM;
CREATE DATABASE GSUACM;
USE GSUACM;
--
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `adminID` varchar(36) NOT NULL,
  `userID` varchar(36) NOT NULL,
  PRIMARY KEY (`adminID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Table structure for table `course`
--

DROP TABLE IF EXISTS `course`;
CREATE TABLE `course` (
  `courseID` varchar(36) NOT NULL ,
  `courseCode` varchar(255) DEFAULT NULL,
  `courseTitle` varchar(255) DEFAULT NULL,
  `tutorID` varchar(36) NOT NULL,
  PRIMARY KEY (`courseID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Table structure for table `message`
--

DROP TABLE IF EXISTS `message`;
CREATE TABLE `message` (
  `messageID` varchar(36) NOT NULL,
  `date` datetime DEFAULT NULL,
  `messageDescription` varchar(255) DEFAULT NULL,
  `senderID` varchar(36) DEFAULT NULL,
  `recieverID` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`messageID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Table structure for table `newsitem`
--

DROP TABLE IF EXISTS `newsitem`;
CREATE TABLE `newsitem` (
  `newsitemID` varchar(36) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `author` varchar(255) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `time` timestamp NULL DEFAULT NULL,
  `body` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`newsitemID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Table structure for table `options`
--

DROP TABLE IF EXISTS `option`;
CREATE TABLE `option` (
  `optionID` varchar(36) NOT NULL,
  `pollID` varchar(36) NOT NULL,
  `text` varchar(255) DEFAULT NULL,
  `votes` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`optionID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Table structure for table `poll`
--

DROP TABLE IF EXISTS `poll`;
CREATE TABLE `poll` (
  `pollID` varchar(36) NOT NULL,
  `pollAuthorID` varchar(36) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `date` date DEFAULT NULL,
  PRIMARY KEY (`pollID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Table structure for table `reciever`
--

DROP TABLE IF EXISTS `reciever`;
CREATE TABLE `reciever` (
  `recieverID` varchar(36) NOT NULL,
  `userID` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`recieverID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
--
-- Table structure for table `sender`
--

DROP TABLE IF EXISTS `sender`;
CREATE TABLE `sender` (
  `senderID` varchar(36) NOT NULL,
  `userID` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`senderID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Table structure for table `tutor`
--

DROP TABLE IF EXISTS `tutor`;
CREATE TABLE `tutor` (
  `tutorID` varchar(36) NOT NULL,
  `feedback` varchar(255) DEFAULT NULL,
  `userID` varchar(36) NOT NULL,
  PRIMARY KEY (`tutorID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Table structure for table `tutorsession`
--

DROP TABLE IF EXISTS `tutorsession`;
CREATE TABLE `tutorsession` (
  `sessionID` varchar(36) NOT NULL ,
  `subject` varchar(255) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `tutorID` varchar(36) DEFAULT NULL,
  `userID` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`sessionID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `userID` varchar(36) NOT NULL,
  `fname` varchar(255) DEFAULT NULL,
  `lname` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `currentClasses` varchar(255) DEFAULT NULL,
  `classesTaken` varchar(255) DEFAULT NULL,
  `isTutor` longblob,
  `isAdmin` longblob,
  `isBoardMember` longblob,
  `title` varchar(255) DEFAULT NULL,
  `points` int(255) DEFAULT NULL,
  PRIMARY KEY (`userID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

ALTER TABLE `admin` ADD CONSTRAINT `userFK` FOREIGN KEY (`userID`) REFERENCES `user` (`userID`) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE `course` ADD CONSTRAINT `tutorFK` FOREIGN KEY (`tutorID`) REFERENCES `tutor` (`tutorID`) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE `message` ADD CONSTRAINT `messageSenderFK` FOREIGN KEY (`senderID`) REFERENCES `sender` (`senderID`) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE `message` ADD CONSTRAINT `messageRecieverFK` FOREIGN KEY (`recieverID`) REFERENCES `reciever` (`recieverID`) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE `reciever` ADD CONSTRAINT `userRecieveFK` FOREIGN KEY (`userID`) REFERENCES `user` (`userID`) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE `sender` ADD CONSTRAINT `userSendKey` FOREIGN KEY (`userID`) REFERENCES `user` (`userID`) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE `tutor` ADD CONSTRAINT `userTutorID` FOREIGN KEY (`userID`) REFERENCES `user` (`userID`) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE `option` ADD CONSTRAINT `pollFK` FOREIGN KEY (`pollID`) REFERENCES `poll` (`pollID`) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE `poll` ADD CONSTRAINT `authorFK` FOREIGN KEY (`pollAuthorID`) REFERENCES `user` (`userID`) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE `reciever` ADD CONSTRAINT `recieverFK` FOREIGN KEY (`userID`) REFERENCES `user` (`userID`) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE `sender` ADD CONSTRAINT `senderFK` FOREIGN KEY (`userID`) REFERENCES `user` (`userID`) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE `tutor` ADD CONSTRAINT `tutorUserFK` FOREIGN KEY (`userID`) REFERENCES `user` (`userID`) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE `tutorsession` ADD CONSTRAINT `sessionTutorFK` FOREIGN KEY (`tutorID`) REFERENCES `tutor` (`tutorID`) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE `tutorsession` ADD CONSTRAINT `sessionUserFK` FOREIGN KEY (`userID`) REFERENCES `user` (`userID`) ON DELETE CASCADE ON UPDATE CASCADE;

INSERT INTO user(fname, lname, password, email, title) VALUES('Griffin', 'Bryant', 'test', 'test@gmail.com', 'Development Team');
INSERT INTO user(fname, lname, password, email, title) VALUES('Test1', 'Test1', 'test', 'test1@gmail.com', 'Member');
INSERT INTO user(fname, lname, password, email, title) VALUES('Test2', 'Test2', 'test', 'test2@gmail.com', 'Member');
INSERT INTO user(fname, lname, password, email, title) VALUES('Test3', 'Test3', 'test', 'test3@gmail.com', 'Member');
INSERT INTO user(fname, lname, password, email, title) VALUES('Test4', 'Test4', 'test', 'test4@gmail.com', 'Member');
INSERT INTO user(fname, lname, password, email, title) VALUES('Test5', 'Test5', 'test', 'test5@gmail.com', 'Mentor');
INSERT INTO user(fname, lname, password, email, title) VALUES('Test6', 'Test6', 'test', 'test6@gmail.com', 'Mentor');
INSERT INTO user(fname, lname, password, email, title) VALUES('Test7', 'Test7', 'test', 'test7@gmail.com', 'Member');
INSERT INTO user(fname, lname, password, email, title) VALUES('Test8', 'Test8', 'test', 'test8@gmail.com', 'Member');
INSERT INTO user(fname, lname, password, email, title) VALUES('Test9', 'Test9', 'test', 'test9@gmail.com', 'Mentor');