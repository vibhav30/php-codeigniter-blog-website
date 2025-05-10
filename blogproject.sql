-- phpMyAdmin SQL Dump
-- Transformed to Tech Blog
-- Compatible with phpMyAdmin

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";

DROP TABLE IF EXISTS `blogs`;
DROP TABLE IF EXISTS `categories`;
DROP TABLE IF EXISTS `users`;

CREATE TABLE `blogs` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `category_id` int(10) NOT NULL,
  `title` varchar(255) NOT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `description` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `blog_image` varchar(100) DEFAULT NULL,
  `created_on` datetime NOT NULL,
  `created_by` int(10) DEFAULT NULL,
  `modified_on` datetime NOT NULL DEFAULT current_timestamp(),
  `modified_by` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `categories` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8 NOT NULL,
  `created_on` datetime NOT NULL,
  `created_by` int(10) NOT NULL,
  `modified_on` datetime NOT NULL DEFAULT current_timestamp(),
  `modified_by` int(10) NOT NULL,
  `published` enum('0','1') NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `created_by` (`created_by`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `users` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created_on` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `categories` (`id`, `title`, `created_on`, `created_by`, `modified_on`, `modified_by`, `published`) VALUES
(1, 'Web Development', '2025-05-08 07:31:10', 1, '2025-05-08 07:31:10', 0, '1'),
(2, 'Machine Learning', '2025-05-08 07:31:10', 1, '2025-05-08 07:31:10', 0, '1'),
(3, 'DevOps & Tools', '2025-05-08 07:31:10', 1, '2025-05-08 07:31:10', 0, '1'),
(4, 'Programming Concepts', '2025-05-08 07:31:10', 1, '2025-05-08 07:31:10', 0, '1');

INSERT INTO `blogs` (`id`, `category_id`, `title`, `slug`, `description`, `blog_image`, `created_on`, `created_by`, `modified_on`, `modified_by`) VALUES
(1, 1, 'Getting Started with HTML and CSS', 'getting-started-html-css', 'HTML and CSS are the foundation of web development. HTML structures content while CSS styles it. Together, they create visually appealing and responsive websites. This post will guide you through the essential tags like <div>, <p>, and <a>, and demonstrate how to apply styling using CSS rules, classes, and IDs. We will also cover tips for writing semantic HTML and managing layout with Flexbox and Grid, two powerful CSS modules. By the end, you will be equipped to create a basic but cleanly structured and styled webpage.', 'htmlcss.jpeg', '2025-05-08 07:31:10', 1, '2025-05-08 07:31:10', 1),

(2, 2, 'Introduction to Machine Learning Algorithms', 'intro-to-ml-algorithms', 'Machine learning algorithms are at the core of data-driven decision making. This post introduces supervised and unsupervised algorithms like Linear Regression, KNN, Decision Trees, and K-Means Clustering. You''ll learn the difference between training on labeled data vs discovering hidden patterns. Each algorithm''s use case is illustrated with real-world examples like spam detection, customer segmentation, and prediction systems. Whether you''re a beginner or revisiting concepts, this guide sets a strong foundation.', 'ml.jpg', '2025-05-08 07:31:10', 1, '2025-05-08 07:31:10', 1),

(3, 3, 'Top 5 DevOps Tools to Learn in 2025', 'top-devops-tools-2025', 'The world of software delivery thrives on automation. This blog explores the top 5 DevOps tools to learn in 2025: Docker, Kubernetes, GitHub Actions, Jenkins, and Terraform. These tools cover containerization, CI/CD pipelines, infrastructure as code, and monitoring. We''ll show how each tool fits into a modern DevOps workflow and how to start using them with real examples and resources. Mastering these will give you a competitive edge in the tech job market.', 'devops.jpeg', '2025-05-08 07:31:10', 1, '2025-05-08 07:31:10', 1),

(4, 4, 'Understanding Time Complexity in Programming', 'understanding-time-complexity', 'Time complexity measures how the runtime of an algorithm increases with input size. Big O notation helps categorize performance. This post breaks down common complexities like O(1), O(n), O(log n), and O(n²) with relatable coding examples. Whether you''re preparing for interviews or writing efficient software, understanding time complexity is essential. We''ll also touch on space complexity and how to identify performance bottlenecks.', 'time.jpg', '2025-05-08 07:31:10', 1, '2025-05-08 07:31:10', 1),

(5, 1, 'Responsive Design: Mobile First Strategy Explained', 'responsive-design-mobile-first', 'A mobile-first strategy ensures your website adapts gracefully from small to large screens. This blog introduces responsive design principles, CSS media queries, and flexible layouts using percentages and viewport units. You''ll learn how to build pages that look great on mobile, tablet, and desktop devices. We''ll also explore testing tools, best practices, and the importance of accessibility in responsive UI design.', 'responsive.jpg', '2025-05-08 07:31:10', 1, '2025-05-08 07:31:10', 1),

(6, 2, 'Supervised vs Unsupervised Learning: Key Differences', 'supervised-vs-unsupervised-learning', 'Supervised learning uses labeled data to predict outcomes, while unsupervised learning finds hidden structures in unlabeled data. This article dives deep into these two core types of machine learning. We''ll compare classification, regression, and clustering methods, giving real-life scenarios like fraud detection (supervised) vs customer segmentation (unsupervised). You''ll walk away knowing which type to apply for your use case.', 'noimage.jpg', '2025-05-08 07:31:10', 1, '2025-05-08 07:31:10', 1),

(7, 3, 'CI/CD Pipelines with GitHub Actions', 'cicd-pipelines-github-actions', 'GitHub Actions is a developer-friendly way to automate building, testing, and deploying applications. This blog walks you through setting up a simple CI/CD pipeline using GitHub workflows. You''ll learn about .yml syntax, reusable actions, triggers like push/pull_request, and deploying to environments like Vercel or Netlify. Perfect for solo devs and startups automating deployment.', 'noimage.jpg', '2025-05-08 07:31:10', 1, '2025-05-08 07:31:10', 1),

(8, 4, 'Recursion in Programming: Explained Simply', 'recursion-in-programming', 'Recursion is a function calling itself to solve sub-problems. Though it can seem confusing, it''s a powerful technique used in algorithms like factorial, Fibonacci, and tree traversal. This blog explains recursion step by step with dry runs, base and recursive cases, and compares it with iteration. You''ll also learn about call stack depth and tail recursion.', 'noimage.jpg', '2025-05-08 07:31:10', 1, '2025-05-08 07:31:10', 1),

(9, 1, 'JavaScript vs TypeScript: Which One Should You Learn?', 'javascript-vs-typescript', 'JavaScript is versatile and works in every browser. TypeScript adds types and helps catch bugs during development. This post compares syntax, developer experience, and adoption across companies. You''ll discover where JS shines (quick scripts, prototypes) and where TS excels (large-scale apps, teams). We''ll also include learning resources and migration guides.', 'jsVsts.jpg', '2025-05-08 07:31:10', 1, '2025-05-08 07:31:10', 1),

(10, 2, 'Intro to Neural Networks for Beginners', 'intro-to-neural-networks', 'Neural networks are inspired by the human brain. They power deep learning for tasks like image recognition, translation, and recommendation systems. This article breaks down the core components: neurons, layers, activation functions, and backpropagation. We''ll use visual diagrams and simple analogies to explain how they learn from data and generalize patterns. No advanced math required — perfect for beginners.', 'neural.png', '2025-05-08 07:31:10', 1, '2025-05-08 07:31:10', 1);


INSERT INTO `users` (`id`, `name`, `username`, `email`, `password`, `created_on`) VALUES
(1, 'Vibhav Gupta', 'vibhav', 'guptavibhav123@gmail.com', 'dc3ea37c73422ac968f360827ac32f5d', '2020-11-01 20:49:47'),
(2, 'Test User', 'test', 'test@gmail.com', '098f6bcd4621d373cade4e832627b4f6', '2020-11-01 21:56:14');

COMMIT;
