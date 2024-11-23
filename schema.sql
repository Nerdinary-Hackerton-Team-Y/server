CREATE TABLE `User` (
                        `Id` int,
                        `name` varchar(100),
                        `username` varchar(100),
                        `nickname` varchar(100),
                        `password` varchar(100),
                        `profilePictureUrl` varchar(20),
                        `status` 'activated' | 'deactivated',
                        `joinedAt` datetime,
                        `updatedAt` datetime,
                        `deletedAt` datetime,
                        PRIMARY KEY (`Id`)
);

CREATE TABLE `Quest` (
                         `Id` int,
                         `postId` int,
                         `title` varchar(100),
                         `status` 'activated' | 'deactivated',
                         `createdAt` datetime,
                         `updatedAt` datetime,
                         `deletedAt` datetime,
                         PRIMARY KEY (`Id`)
);

CREATE TABLE `Post` (
                        `Id` int,
                        `userId` int,
                        `imageUrl` varchar(100),
                        `content` varchar(100),
                        `isQuest` int,
                        `status` 'activated' | 'deactivated',
                        `createdAt` datetime,
                        `updatedAt` datetime,
                        `deletedAt` datetime,
                        PRIMARY KEY (`Id`),
                        FOREIGN KEY (`userId`) REFERENCES `User`(`Id`),
                        FOREIGN KEY (`content`) REFERENCES `Quest`(`Id`)
);

CREATE TABLE `Comment` (
                           `Id` int,
                           `userId` int,
                           `postId` int,
                           `content` varchar(100),
                           `status` 'activated' | 'deactivated',
                           `createdAt` datetime,
                           `updatedAt` datetime,
                           `deletedAt` datetime,
                           PRIMARY KEY (`Id`),
                           FOREIGN KEY (`userId`) REFERENCES `User`(`Id`),
                           FOREIGN KEY (`deletedAt`) REFERENCES `Post`(`Id`)
);

CREATE TABLE `Like` (
                        `Id` int,
                        `postId` int,
                        `userId` int,
                        `status` 'activated' | 'deactivated',
                        `createdAt` datetime,
                        `updatedAt` datetime,
                        `deletedAt` datetime,
                        PRIMARY KEY (`Id`),
                        FOREIGN KEY (`userId`) REFERENCES `User`(`Id`),
                        FOREIGN KEY (`Id`) REFERENCES `Post`(`Id`)
);

CREATE TABLE `Hashtag` (
                           `Id` int,
                           `tag` varchar(100),
                           `status` 'activated' | 'deactivated',
                           `createdAt` datetime,
                           `updatedAt` datetime,
                           `deletedAt` datetime,
                           PRIMARY KEY (`Id`)
);

CREATE TABLE `PostHashtag` (
                               `Id` int,
                               `postId` int,
                               `hashtagId` int,
                               PRIMARY KEY (`Id`),
                               FOREIGN KEY (`Id`) REFERENCES `Post`(`Id`),
                               FOREIGN KEY (`postId`) REFERENCES `Hashtag`(`Id`)
);

