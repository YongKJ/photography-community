/*
Navicat MySQL Data Transfer

Source Server         : server
Source Server Version : 80021
Source Host           : 47.100.90.204:3306
Source Database       : graduation

Target Server Type    : MYSQL
Target Server Version : 80021
File Encoding         : 65001

Date: 2021-02-22 20:42:51
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `tbl_artcoll`
-- ----------------------------
DROP TABLE IF EXISTS `tbl_artcoll`;
CREATE TABLE `tbl_artcoll` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userid` int NOT NULL,
  `artid` int NOT NULL,
  `date_time` varchar(40) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `flag` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `userid` (`userid`) USING BTREE,
  KEY `artid` (`artid`) USING BTREE,
  CONSTRAINT `tbl_artcoll_ibfk_1` FOREIGN KEY (`artid`) REFERENCES `tbl_article` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tbl_artcoll_ibfk_2` FOREIGN KEY (`userid`) REFERENCES `tbl_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_artcoll
-- ----------------------------

-- ----------------------------
-- Table structure for `tbl_article`
-- ----------------------------
DROP TABLE IF EXISTS `tbl_article`;
CREATE TABLE `tbl_article` (
  `id` int NOT NULL AUTO_INCREMENT,
  `image` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `title` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `tag` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `date_time` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `glance` int NOT NULL,
  `coll` int NOT NULL,
  `users_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `users_id` (`users_id`) USING BTREE,
  CONSTRAINT `tbl_article_ibfk_1` FOREIGN KEY (`users_id`) REFERENCES `tbl_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_article
-- ----------------------------
INSERT INTO `tbl_article` VALUES ('18', 'static/image/works/cover/16011822028517000_200134353.jpg', '博文精选 | 你为什么总是拍不出好照片', '', '**问题一**：不知道什么样的照片才是好看的\r\n\r\n知道什么是好看的，才能有意识的去拍摄好看的画面，美的照片要兼顾氛围美和人物美两个方面。\r\n\r\n解决方法：先系统学习摄影美学，然后多看好的照片，并且带着分析和学习的眼光去看好照片哪些地方值得我们学习。\r\n![16011969002865186_200134353.jpg](http://wind.yongkj.cn/static/image/article/1503114416011969002865186_200134353.jpg)\r\n\r\n**问题二**：没有在恰当的时间、出现在恰当的位置 \r\n\r\n想要让照片有氛围美，要先找到好看的场景、等待最好的天气、最佳的拍摄时间、寻找绝佳的构图。这是女摄影师容易忽略的部分。\r\n\r\n解决方法：学习和练习选择场景、选择光线和构图的方法\r\n![16011969145180635_200134353.jpg](http://wind.yongkj.cn/static/image/article/1521441116011969145180635_200134353.jpg)\r\n\r\n**问题三**：缺少摄影技术以外的美学知识\r\n\r\n想要让拍摄的人物更美，要有充分的前期准备，包括设计适合她的拍摄风格、准备合适的服装造型和道具，还要能引导她摆姿势、调动她的情绪、让表情和动作生动鲜活。这是男摄影师容易忽略的问题。\r\n\r\n解决方法：学习和练习拍摄角度、颜色搭配、服装搭配、五官风格分析、妆容造型、姿势情绪引导的方法\r\n![16011969345656512_200134353.jpg](http://wind.yongkj.cn/static/image/article/1501500316011969345656512_200134353.jpg)\r\n\r\n**问题四**：后期技巧不足或过分后期\r\n\r\n拍出一张好照片，前期、后期一个都不能少。同时，不能后期过度。\r\n\r\n解决方法：学习后期的目的、后期到底在修什么，系统学习后期的方法。\r\n![16011969547427381_200134353.jpg](http://wind.yongkj.cn/static/image/article/1542105216011969547427381_200134353.jpg)\r\n\r\n学习摄影不是会用相机那么简单，这几点也不是换个更好的相机就能解决的问题。\r\n\r\n摄影美学的主要内容就是要用氛围的烘托去让人物显得更美。\r\n\r\n学会了这些，你才能跳出“男摄影师的视觉只有光线构图美”和“女摄影师的视觉只有人物美”的局限，让你的照片在每个方面都挺美的。\r\n\r\n\r\n\n', '2021-02-18 00:00:00', '202', '0', '15');
INSERT INTO `tbl_article` VALUES ('20', 'static/image/works/cover/16046296957190143_200134353.jpg', '博文精选 | 秋冬之际的一抹温柔 化尽心间', '', '你是否有过被照片所折服，甚至感动的時刻\r\n\r\n叶落归根，天气逐渐转凉\r\n\r\n在这个秋冬之际，即使外头天寒地冻，内心也如注入暖流温暖无比\r\n\r\n![16045834182046530_200134353.jpg](http://wind.yongkj.cn/static/image/article/1520054416045834182046530_200134353.jpg)\r\n\r\n**春**「收到过一瓣春天的花瓣，就是收到春天」\r\n\r\n![16046281401057525_200134353.jpg](http://wind.yongkj.cn/static/image/article/1504445016046281401057525_200134353.jpg)\r\n\r\n![16046296943980179_200134353.jpg](http://wind.yongkj.cn/static/image/article/1544351416046296943980179_200134353.jpg)\r\n\r\n![16046296945208860_200134353.jpg](http://wind.yongkj.cn/static/image/article/1541555016046296945208860_200134353.jpg)\r\n\r\n![16046296951514810_200134353.jpg](http://wind.yongkj.cn/static/image/article/1522042216046296951514810_200134353.jpg)\r\n\r\n「湖水里有星光，春风里有你」\r\n\r\n![16045837646349248_200134353.gif](http://wind.yongkj.cn/static/image/article/1515435216045837646349248_200134353.gif)\r\n\r\n![16045837632669677_200134353.gif](http://wind.yongkj.cn/static/image/article/1555411116045837632669677_200134353.gif)\r\n\r\n**夏**「温柔是能被照亮的碎片」\r\n\r\n![16046298174727698_200134353.jpg](http://wind.yongkj.cn/static/image/article/1513504116046298174727698_200134353.jpg)\r\n\r\n![16046298173703924_200134353.jpg](http://wind.yongkj.cn/static/image/article/1500431316046298173703924_200134353.jpg)\r\n\r\n\r\n“时光是台造梦机”\r\n\r\n最接近梦的就是夜晚\r\n\r\n夏日夜晚来临之时\r\n\r\n许多的梦正悄然出现\r\n\r\n\r\n\r\n「云之彼端」\r\n\r\n![16046298651733166_200134353.jpg](http://wind.yongkj.cn/static/image/article/1553450416046298651733166_200134353.jpg)\r\n\r\n![16046298654027873_200134353.jpg](http://wind.yongkj.cn/static/image/article/1550015216046298654027873_200134353.jpg)\r\n\r\n**秋**「可爱治愈一切不可爱」\r\n\r\n![16045846064468179_200134353.jpg](http://wind.yongkj.cn/static/image/article/1551325316045846064468179_200134353.jpg)\r\n\r\n![16045846061878826_200134353.jpg](http://wind.yongkj.cn/static/image/article/1532525116045846061878826_200134353.jpg)\r\n\r\n**冬**「闪闪发亮的冬天」\r\n\r\n![16045846827149041_200134353.jpg](http://wind.yongkj.cn/static/image/article/1501100316045846827149041_200134353.jpg)\r\n\r\n![16045846822222622_200134353.jpg](http://wind.yongkj.cn/static/image/article/1552005516045846822222622_200134353.jpg)\r\n\r\n**- 最后 -** 每一张画都是令人赏心悦目、心旷神怡的，仿佛被治愈了一般，所有的乏累都烟消云散\r\n\r\n\n', '2021-01-18 00:00:00', '202', '0', '15');
INSERT INTO `tbl_article` VALUES ('21', 'static/image/works/cover/16097284425995771_200134353.jpg', '博文精选 | 大冬天不暖被，摄影师都去干嘛', '', '虽然钻出被窝变得越来越困难，但冬天可做的事、可吃的东西、可过的节那真是一点也不少。\r\n\r\n虽然冬天冻得人耳朵通红，但一想到糖葫芦、糖炒栗子和麻辣烫，立马心里觉得暖呼呼的；\r\n\r\n虽然冬天冷的让人不想动，但是只要一想到暖乎乎的太阳、街上热闹的景象，就又有了出门的动力；\r\n\r\n虽然冬天冷的让人不想把手拿出兜里，但一想到冬天的各色美景，摄影师们就再也忍不住了……\r\n\r\n今天，让我们一起在寒冷的冬日照片中找到“火”一样的生活热情~\r\n\r\n#### 冬景不够看\r\n\r\n![16097285325779571_200134353.jpg](http://wind.yongkj.cn/static/image/article/1553001016097285325779571_200134353.jpg)\r\n在拍摄这张作品时，零下30度，6-7级的白毛风挂得人站不住脚。眼前的场景，让我联想到后天了场景。联想到流浪地球里的场景。\r\n\r\n远处的人物，可能是刚从地下世界回到地面寻找食物的勇者。\r\n\r\n![16097285456924174_200134353.jpg](http://wind.yongkj.cn/static/image/article/1543402016097285456924174_200134353.jpg)\r\n去年这个时候拍的雪原晨曦，虽然冻得手脚冰凉，但人是兴奋的！看着太阳慢慢从白茫茫的雪原升起，慢慢的色彩开始变化，眼前的景象犹如仙境！\r\n\r\n![16097300182044202_200134353.jpg](http://wind.yongkj.cn/static/image/article/1541334316097300182044202_200134353.jpg)\r\n这一大丛紫色的花朵开放在博格达峰北坡山脚下，从营地过去需要趟过一条冰河的好几个支流，再翻过一个山坡，一直走到冰山下最近的一个冰斗湖边，它就在一个山坳里，无声无息，不管不顾，无比热烈地盛放着。\r\n\r\n![16097323333269282_200134353.JPG](http://wind.yongkj.cn/static/image/article/1543532316097323333269282_200134353.JPG)\r\n位于北海道最东北边的知床半岛，紧临鄂霍次克海洋，在夏天可以乘船追鲸，冬天可以踏雪寻鹿。\r\n\r\n人说：“林深时见鹿，海蓝时见鲸”，在这里能得到最完美的诠释。\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n', '2021-01-18 00:00:00', '201', '0', '15');
INSERT INTO `tbl_article` VALUES ('22', 'static/image/works/cover/N2q8hRVzEg8.jpg', '博文精选 | 关于摄影中的颜色，这一篇给你整理好了！', '', '关于摄影里的色彩，想必大家都明白其重要性。\r\n\r\n可以说，一个人的偏好与审美，取决于他相片里的色彩取向。\r\n\r\n有人喜欢低调带有质感的黑白影像，有人则迷恋色彩鲜明、或清新或浓郁的彩色照片。\r\n\r\n那今天就来和大家聊聊关于摄影里，这些色彩是如何被运用在各种类型的作品上吧~\r\n\r\n#### 「 紫 之 偏 差 」\r\n![16087752722027788_200134353.jpg](http://wind.yongkj.cn/static/image/article/1512103216087752722027788_200134353.jpg)\r\n\r\n![16087753418493970_200134353.JPG](http://wind.yongkj.cn/static/image/article/1541323416087753418493970_200134353.JPG)\r\n\r\n在关于无限遐想的天空里，摄影师抹上神秘的紫色更令人陶醉于美好的日常中\r\n![16087753612723348_200134353.JPG](http://wind.yongkj.cn/static/image/article/1523425016087753612723348_200134353.JPG)\r\n\r\n#### 「 绿 之 生 机 」\r\n![16087753805652099_200134353.JPG](http://wind.yongkj.cn/static/image/article/1552315516087753805652099_200134353.JPG)\r\n\r\n![16087753807651413_200134353.JPG](http://wind.yongkj.cn/static/image/article/1514001116087753807651413_200134353.JPG)\r\n\r\n![16087753806547336_200134353.JPG](http://wind.yongkj.cn/static/image/article/1550143116087753806547336_200134353.JPG)\r\n\r\n万物最爱那一抹绿\r\n\r\n摄影师镜头里的绿色来得生机勃勃 就像春天再次降临追光者\r\n![16087753804155203_200134353.JPG](http://wind.yongkj.cn/static/image/article/1503552316087753804155203_200134353.JPG)\r\n\r\n#### 「 橘 之 热 烈 」\r\n![16087757435339653_200134353.jpg](http://wind.yongkj.cn/static/image/article/1524142416087757435339653_200134353.jpg)\r\n\r\n![16087757437328849_200134353.jpg](http://wind.yongkj.cn/static/image/article/1532145016087757437328849_200134353.jpg)\r\n\r\n橘色 是路灯照射的颜色、是阳光扩散的颜色、是秋日散步时的 天然馈赠\r\n![16087757798392736_200134353.jpg](http://wind.yongkj.cn/static/image/article/1513132516087757798392736_200134353.jpg)\r\n\r\n#### 「 红 之 艳 丽 」\r\n![16087758751760769_200134353.JPG](http://wind.yongkj.cn/static/image/article/1515040216087758751760769_200134353.JPG)\r\n\r\n![16087758768395936_200134353.JPG](http://wind.yongkj.cn/static/image/article/1550121416087758768395936_200134353.JPG)\r\n\r\n#### 「 黑 白 之 极 简 」\r\n![16087760437527192_200134353.jpg](http://wind.yongkj.cn/static/image/article/1545055316087760437527192_200134353.jpg)\r\n\r\n黑白极简\r\n\r\n但是要做到恰到好处并没有彩色的简单\r\n\r\n这就是黑白的魅力\r\n\r\n白色象征神圣、纯洁\r\n\r\n黑色则是象征神密、稳重\r\n\r\n一白一黑的搭配 有1＋1＞2的效果\r\n![16087760608762564_200134353.jpg](http://wind.yongkj.cn/static/image/article/1535145316087760608762564_200134353.jpg)\r\n\r\n![16087760607944995_200134353.jpg](http://wind.yongkj.cn/static/image/article/1545210516087760607944995_200134353.jpg)\r\n\r\n#### 「 彩 色 之 特 别 」\r\n![16087762779160869_200134353.jpeg](http://wind.yongkj.cn/static/image/article/1555024216087762779160869_200134353.jpeg)\r\n\r\n![16087763043557264_200134353.jpg](http://wind.yongkj.cn/static/image/article/1502052116087763043557264_200134353.jpg)\r\n\r\n每个人喜欢的色彩调子，可以有很多种，这些都是每个人不同的喜好，风格。\r\n\r\n也没有所谓哪个会比另外一个高级。\r\n\r\n简而言之，作为摄影师，色彩就是“语言”，甚至比真正的语言表达更让作者感到放松与擅长。\r\n\r\n所有想要宣泄的情绪，林林总总的思绪情感，过往的生活经历与感悟，最终都会呈现在作品的色彩中。\r\n\r\n\r\n\r\n\r\n\n\n\n\n\n', '2021-01-18 00:00:00', '204', '0', '15');
INSERT INTO `tbl_article` VALUES ('23', 'static/image/works/cover/16079150982338659_200134353.JPG', '博文精选 | 国风摄影作品赏析及推荐', '', '“国风”一词出自《诗经》，属于诗经内容“风雅颂”中的“国风”部分。采集的大多是民间歌谣。现在的国风泛指一切文化遗产。\r\n不知不觉，国风火了起来，这股来自东方的风，终于吹遍了大江南北。而在摄影界中，更是看到了许多国风的元素。那么摄影作品中，有哪些内容可以融入进国风作品中呢。\r\n本期就让颇可带着大家一起，学习拍摄高级又精美的国风大片吧~\r\n\r\n「国风」并不只是对于古典和传统的弘扬，更是一种不随时代变化而自我改变的态度。\r\n\r\n因此，在许多作品中，我们可以看到国潮文化与现代视觉的交织，这种巧妙融合为「国风」赋予了更多的灵感。\r\n\r\n背景是人尽皆知的宫殿，模特穿上古时象征地位的金黄色长袍，夸张的现代浓妆，两个极具特色又不同的风格相互碰撞出更热烈的火花。\r\n\r\n![16079150379308407_200134353.jpg](http://wind.yongkj.cn/static/image/article/1503331416079150379308407_200134353.jpg)\r\n\r\n具有现代元素的古风作品，越来越多利用后期，将前期无法构成的氛围打造出来，比如通过汉服轻盈的长袖及飘起的长发，达到动态效果，同时背景和主题相结合构成水墨画的意境\r\n\r\n![16079150792484890_200134353.jpg](http://wind.yongkj.cn/static/image/article/1500334516079150792484890_200134353.jpg)\r\n\r\n衣袂翩翩，携一把油扇子，好一个再顾倾人国。\r\n\r\n![16079150982338659_200134353.JPG](http://wind.yongkj.cn/static/image/article/1525423016079150982338659_200134353.JPG)\r\n\r\n古代有许多神话传说，通过后期来实现这些画面，化“神话”为“现实”。\r\n\r\n![16079151212654716_200134353.jpg](http://wind.yongkj.cn/static/image/article/1541241116079151212654716_200134353.jpg)\r\n\r\n既可以在天上飞，不妨可以在水下游，也是仙气又创意十足的国风作品。\r\n\r\n![16079151424618077_200134353.jpg](http://wind.yongkj.cn/static/image/article/1550214216079151424618077_200134353.jpg)\r\n\r\n“古装剧”也是许多年轻人的热捧对象。把国风作品拍出电影感，【氛围】很重要，相较于后期带来的视觉冲击，画面以及构图显得极简，但画中有内容、有故事，引人回味。\r\n\r\n![16079151825495277_200134353.jpg](http://wind.yongkj.cn/static/image/article/1544155416079151825495277_200134353.jpg)\r\n\r\n中国古代有诸多经典人物，其中都具有各自特殊的身份，有些已经深深植入我们的脑子里，一提到相关的内容便会联想到他们的形象。\r\n比如巾帼不让须眉里的花木兰，是个干练的古代女性形象代表。\r\n\r\n![16079152465806873_200134353.jpg](http://wind.yongkj.cn/static/image/article/1511540516079152465806873_200134353.jpg)\r\n\r\n![16079152624598748_200134353.jpg](http://wind.yongkj.cn/static/image/article/1505021416079152624598748_200134353.jpg)\r\n\r\n说起国风，最具代表的就是汉服了。汉服是汉族的民族服饰，到如今更是掀起了一阵阵热潮。衣美，人美，文化更美。\r\n\r\n![16079155172863797_200134353.jpg](http://wind.yongkj.cn/static/image/article/1551424416079155172863797_200134353.jpg)\r\n\r\n野有蔓草，零露漙兮。有美一人，清扬婉兮。\r\n\r\n![16079155025634076_200134353.JPG](http://wind.yongkj.cn/static/image/article/1531132316079155025634076_200134353.JPG)\r\n\r\n国风里其中一个不可忽视的元素还有各种华丽的配饰。单配饰就有发簪，发夹，发梳，发冠等分类，还有手饰颈饰发型妆容等等，不同时期呈现出不同的喜好，就和现在潮流永远在更新般，其内大有乾坤。\r\n\r\n![16079155489297611_200134353.jpg](http://wind.yongkj.cn/static/image/article/1555121316079155489297611_200134353.jpg)\r\n\r\n中国传统文化中，戏曲是一大璀璨之星，相比古代人们的日常服饰，戏曲的服装更夸张及艳丽，因此这一类的国风作品中，往往有不错的视觉效果。\r\n\r\n![16079155899659664_200134353.jpg](http://wind.yongkj.cn/static/image/article/1540013216079155899659664_200134353.jpg)\r\n\r\n国风，是一种绝美的意境淡淡清韵，足以写尽世间意境。\r\n\r\n是大隐隐于市的超然洒脱，山间明月在窗前，城市繁华于掌间。引诗落笔，谱写东方。与中国元素有关的一切，也是一切元素都无法定义的所在。\r\n在意象与审美之外，意境与情怀，才是底色。\r\n\r\n如今百花齐放的国风作品不断出现，怎能不令人心神向往。\r\n\r\n若你看完此篇文章，对国风作品有了自己的想法，就拿起手中的相机，来拍摄属于你心中的「国风」大片吧！\r\n\r\n', '2021-01-18 00:00:00', '211', '0', '15');
INSERT INTO `tbl_article` VALUES ('24', 'static/image/works/cover/16023197491808028_200134353.jpg', '博文精选 | 给你一点甜，马卡龙色系摄影风格', '', '![16024959568708202_200134353.jpg](http://wind.yongkj.cn/static/image/article/1541422516024959568708202_200134353.jpg)\r\n\r\n马卡龙色，源于法国甜品马卡龙，事实上马卡龙色是一种高级灰色系，相对于糖果色来说，它的鲜艳度和饱和度没那么高，给人的感觉是淡雅柔和、对比和反差较小，充满粉嫩青春感。\r\n\r\n如上图是糖果色和马卡龙色的搭配，从中也可体会到这两者还是有些差别。\r\n\r\n我们可以看一些马卡龙色的图片进一步感受这类图片的特点。\r\n\r\n![16024960025862956_200134353.jpg](http://wind.yongkj.cn/static/image/article/1552405016024960025862956_200134353.jpg)\r\n\r\n![16024960022045993_200134353.jpg](http://wind.yongkj.cn/static/image/article/1512155216024960022045993_200134353.jpg)\r\n\r\n![16024960535615505_200134353.jpg](http://wind.yongkj.cn/static/image/article/1500433516024960535615505_200134353.jpg)\r\n\r\n![16024960548061231_200134353.jpg](http://wind.yongkj.cn/static/image/article/1510324116024960548061231_200134353.jpg)\r\n\r\n1、下面我们总结一下马卡龙色特点：高明度、低饱和、低对比；为弥补低对比造成不通透，画面中还需要局部透亮的感觉，即需要小范围高光；追求饱和度和明度比较统一，而色相上变化。\r\n\r\n在了解和掌握了马卡龙色的特点后，我们来实操一番。\r\n\r\n先上原图和对比图。\r\n\r\n![16024961063559007_200134353.jpg](http://wind.yongkj.cn/static/image/article/1542451116024961063559007_200134353.jpg)\r\n\r\n原图是在硬盘里吃灰的“废图”，在某次翻阅的时候感觉沙脊的光影很润，感觉还有救，如果再调成马卡龙色调，想必会别有一番滋味。\r\n\r\n所以我的调色方向是马卡龙色，沙漠偏粉红，天空偏粉青或粉蓝，光影上强化油润感。\r\n\r\n进入ACR，先进行镜头校正，再进行基础调整。调整时只需关注沙漠和天空，下方的人和骆驼是我后面要裁剪掉的区域。\r\n\r\n![16024963964972243_200134353.jpg](http://wind.yongkj.cn/static/image/article/1504452316024963964972243_200134353.jpg)\r\n\r\n基本面板，色温往黄色偏，色调向洋红方向偏，我们知道黄色加上洋红色会变成红色，所以沙漠会带上淡淡的粉红，基于此时是全局调整，还要保证天空不太偏色，所以色温色调调整数值不宜过大。\r\n\r\n原图曝光足够，降低高光防止高光过曝，提升阴影和黑色从而降低对比，提一点白色让高光点透亮，因为原图是光圈开得比较大，我还增加了清晰度。\r\n\r\n![16024964064752853_200134353.jpg](http://wind.yongkj.cn/static/image/article/1510314316024964064752853_200134353.jpg)\r\n\r\n曲线面板未调整，进入细节面板。\r\n\r\n锐化数量我加的很多，还是弥补前期光圈问题，半径和细节保持默认，\r\n\r\n按住Alt键拖动蒙版滑块，可以清楚看到锐化范围，白色为锐化作用区域，黑色为不作用区域，我只想锐化沙漠边界线，于是就相应控制蒙版数值。\r\n\r\n![16024964171079470_200134353.jpg](http://wind.yongkj.cn/static/image/article/1504320316024964171079470_200134353.jpg)\r\n\r\n进入HSL面板，也是调整的重点面板。\r\n\r\n首先这张图中沙漠由橙色色相和黄色色相控制，橙色往红色方向调整，黄色往橙色方向调整，进一步改变沙漠色相，使其往粉红色偏。\r\n\r\n天空主要由蓝色控制，浅绿色也控制一小部分，于是我将蓝色滑块往青色调整，浅绿色（即青色）往青蓝方向调整，使天空色相偏青蓝；\r\n\r\n适当增加黄色、橙色、蓝色饱和度，以保持颜色饱和度的统一；适当提升黄色、橙色、蓝色明度。\r\n\r\n\r\n![16024964468655256_200134353.jpg](http://wind.yongkj.cn/static/image/article/1523512016024964468655256_200134353.jpg)\r\n\r\n![16024964464266389_200134353.jpg](http://wind.yongkj.cn/static/image/article/1505444116024964464266389_200134353.jpg)\r\n\r\n![16024964467474642_200134353.jpg](http://wind.yongkj.cn/static/image/article/1505353116024964467474642_200134353.jpg)\r\n\r\n分离色调这里我觉得没有必要调整，然后我就进入相机校准面板，这对于这张图的调色也是一个重要的调整面板。\r\n\r\n首先我将红原色往左调整，此时主要变化是红色会偏粉，将绿原色往右调整，主要变化是品红色会偏红，这样沙漠的颜色就统一往粉红方向改变。\r\n\r\n蓝原色往左调整，天空的蓝色会偏青，沙漠原来的黄色就会偏红，进一步将整个图往我一开始的设想方向靠拢，即天空粉蓝或粉青而沙漠粉红。\r\n\r\n![16024964655716987_200134353.jpg](http://wind.yongkj.cn/static/image/article/1535542416024964655716987_200134353.jpg)\r\n\r\n2、点击打开对象，进入PS，复制图层，3：2比例裁切。\r\n\r\n但我此时有了另一种想法，原图这种高云族的碎云有点不美观，而且造成整个画面不纯净，于是我想通过换天加上另外做的云朵来进行进一步的美化。\r\n\r\n![16024965546728079_200134353.jpg](http://wind.yongkj.cn/static/image/article/1530402116024965546728079_200134353.jpg)\r\n\r\n通过钢笔工具建立选区抠图，将沙漠图层复制出来。\r\n\r\n![16024965798608053_200134353.jpg](http://wind.yongkj.cn/static/image/article/1522223516024965798608053_200134353.jpg)\r\n\r\n建立可选颜色调整图层，进一步增强和纯化沙漠的色彩。\r\n\r\n![16024966103137767_200134353.jpg](http://wind.yongkj.cn/static/image/article/1514435316024966103137767_200134353.jpg)\r\n\r\n建立背景层，选择明度较高饱和度较低的蓝色填充，创建智能对象，进入滤镜——Camera Raw滤镜，通过径向滤镜降曝光压暗背景层上部\r\n\r\n![16024966565719425_200134353.jpg](http://wind.yongkj.cn/static/image/article/1502001216024966565719425_200134353.jpg)\r\n\r\n![16024967645319157_200134353.jpg](http://wind.yongkj.cn/static/image/article/1533053116024967645319157_200134353.jpg)\r\n\r\n合并图层，然后使用图章工具修瑕疵。\r\n\r\n![16024967845020333_200134353.jpg](http://wind.yongkj.cn/static/image/article/1502335216024967845020333_200134353.jpg)\r\n\r\n合并图层，点击图层——新建——图层，建立中性灰图层，利用画笔刷光影，使光影增强油润感。\r\n\r\n![16024968302638561_200134353.jpg](http://wind.yongkj.cn/static/image/article/1501140116024968302638561_200134353.jpg)\r\n\r\n![16024968505894337_200134353.jpg](http://wind.yongkj.cn/static/image/article/1513510316024968505894337_200134353.jpg)\r\n\r\n合并图层，发现色彩饱和度偏低，并且整个画面对比不够，使得整个画面感觉比较灰，虽说马卡龙色追求低对比，但对比太低会使图像太灰，反而不好。\r\n\r\n创建智能对象，点击滤镜——Camera Raw滤镜，选择径向滤镜进一步压暗天空，提升白色并压暗高光，使高光更集中透亮，以上操作使光影不那么平；\r\n\r\n提升红色、橙色、蓝色饱和度，使色彩饱和度达到一个比较舒服的值，最后通过相机校准将蓝原色左偏，原理如前述，目的还是纯化颜色，靠拢色相。\r\n\r\n![16024973392569030_200134353.jpg](http://wind.yongkj.cn/static/image/article/1524430416024973392569030_200134353.jpg)\r\n\r\n![16024973393636937_200134353.jpg](http://wind.yongkj.cn/static/image/article/1524501516024973393636937_200134353.jpg)\r\n\r\n3、随后加入我之前已经做好的素材云，这种比较厚实的云朵可以通过普通云朵多次叠加得到，如有机会我可以详细讲解，\r\n\r\n云素材图层选择滤色模式，使云朵更好地融入天空，然后建立剪切空白图层，用画笔刷光影，图层模式选择柔光（原理同中性灰）。\r\n\r\n![16024974003033690_200134353.jpg](http://wind.yongkj.cn/static/image/article/1532535516024974003033690_200134353.jpg)\r\n\r\n然后合并图层，因为我想将云朵和沙脊锐化效果强一些，而其他沙子锐化弱一点，所以使用分层锐化。再通过Camera Raw滤镜添加颗粒，防止天空出现断层，导出。\r\n\r\n![16024974429704140_200134353.jpg](http://wind.yongkj.cn/static/image/article/1542134116024974429704140_200134353.jpg)\r\n\r\n![16024974428260265_200134353.jpg](http://wind.yongkj.cn/static/image/article/1500321516024974428260265_200134353.jpg)\r\n\r\n', '2021-01-18 00:00:00', '10', '0', '15');
INSERT INTO `tbl_article` VALUES ('25', 'static/image/works/cover/15617064117093018_200967826.jpg', '夏天在室内吹空调也能玩的摄影风格！简单又实用！', '', '![15617077944141984_200967826.png](http://wind.yongkj.cn/static/image/article/1542214115617077944141984_200967826.png)\r\n\r\n![15617077958381634_200967826.png](http://wind.yongkj.cn/static/image/article/1553121215617077958381634_200967826.png)\r\n\r\n大家好我是双一！坐标合肥的国风摄影师！此刻正在家里吹着空调喝着冰阔落给大家码字写教程啦啦啦~~~\r\n\r\n夏天的温度上升得越来越陡峭啦，相信许多小伙伴也因为天气炎热而畏怯出门拍摄吧。\r\n\r\n所以，今天这一期，我就来和大家分享一组**借助投影仪拍出来的硬核时尚中国风**，让大家在室内也能开心的撸片，并且玩出大牌的创意！\r\n\r\n本次涉及到的后期教程相对较小一些，因为这组照片后期的程度不是很高。（其实是我找不到原片了……哭！）\r\n\r\n嘛，主要是和大家聊一聊**投影图片的选择、闪光灯和色片的运用、拍摄时人物与投影之间的搭配**之类。\r\n\r\n可能要更加适合入门的小伙伴，偏**经验和分享**型。\r\n\r\n同时也是提出一个小小的思路，原来投影仪也可以这样玩！\r\n\r\n这次拍摄也特别巧，正好有工作室的小伙伴帮我拍了花絮视频，现场拍摄的状况我也会从视频里截图出来，发给大家看，方便大家理解~\r\n\r\n和coser希小白合作的一次拍摄，开始只是设想做个投影的时尚汉服，穿个魏晋制带个假发片什么的……\r\n\r\n但见面的时候我就哭了……他刚染了头发，而且还是金黄色的！\r\n\r\n![15617078057749660_200967826.png](http://wind.yongkj.cn/static/image/article/1524032215617078057749660_200967826.png)\r\n\r\n这……虽然也是盛世美颜，但……\r\n\r\n好吧好吧，那咱们索性换个思路吧！\r\n\r\n**一台笔记本链接投影仪，一个闪光灯，一个黄色色片**。\r\n\r\n明明只是穿了个再普通不过的白衬衫，却是拍出了洒金泼墨中国风的味道！\r\n\r\n下面就来走进拍摄现场，详细揭秘吧！\r\n\r\n相信大家对投影仪应该都不陌生，其实也就是普通的家用投影仪啦。\r\n\r\n我自己买的是个小牌子，有的时候在工作室开分享公开课的时候，会把电脑屏幕投在墙上，方便大家看到。\r\n\r\n因为家里也有比较大寸的电视机，感觉也不需要用投影来看电影啥的，所以其他时间就属于放在角落里吃灰的类型。\r\n\r\n所以如果不是经常需要用的话，可以不需要买，找朋友借一个来拍拍照就好~\r\n\r\n![15617078234629756_200967826.png](http://wind.yongkj.cn/static/image/article/1524515115617078234629756_200967826.png)\r\n\r\n我自己的投影仪牌子不太记得了，价格大概是两千左右，算是比较便宜，用起来也没啥毛病，百度上找了个图片，类似上图这种。\r\n\r\n大概越贵的投影仪可能有一点好处就是流明度越高，在比较亮的环境下也能显现出较为清晰的影像。\r\n\r\n所以我在使用的时候，尽量是让环境要暗一些，这样投影的效果更好。当时拍的棚子在地下室，四周都没有窗户，自然也就很暗啦~\r\n\r\n那么接踵而至的问题就来啦！\r\n\r\n当整个房间偏暗的时候，投影落在背景纸和人的身上就会显得很亮很亮了。\r\n\r\n这么亮……\r\n\r\n![15617078694327261_200967826.png](http://wind.yongkj.cn/static/image/article/1554320215617078694327261_200967826.png)\r\n\r\n亮得小哥哥都有些睁不开眼睛……\r\n\r\n既然如此，何不直接把其作为我们拍摄用的【主光源】？\r\n\r\n这投影的亮，其实就算得上的一款led常亮照着呀！\r\n\r\n![15617079043511866_200967826.png](http://wind.yongkj.cn/static/image/article/1534225015617079043511866_200967826.png)\r\n\r\n简单粗暴的把投影定为拍摄的主光源之后，我们需要一个**辅光源**。\r\n\r\n通常来说，一个完整的布光系统，是由“**主光源**”、“**辅光源**”、“**环境光**”三个要素来组成的。\r\n\r\n最为经典的案例就是**伦勃朗布光**：\r\n\r\n![15617079343126385_200967826.png](http://wind.yongkj.cn/static/image/article/1543305315617079343126385_200967826.png)\r\n\r\n当然，这说的是三种光，并非是三个光。因为有些时候，辅光源也可能是多个，环境光也可能是白天的太阳。\r\n\r\n针对我们这组照片，由于主光源是投影仪，属于一个正面的大平光，为了突出模特的面部轮廓，塑造更为立体的影像，我决定要在模特的左前方放一盏闪光灯，作为辅助光。\r\n\r\n而这个光源，是用一盏**机顶闪**来完成的。\r\n\r\n![15617079478606598_200967826.png](http://wind.yongkj.cn/static/image/article/1501344315617079478606598_200967826.png)\r\n\r\n可能入门初学的小伙伴脑海里认为，机顶闪就只能放在相机上面使用，其实不然。\r\n\r\n如果你也遇到拍摄空间有限的时候，可以和我一样，试试把机顶闪离机使用。\r\n\r\n只需要增加一个引闪器，它就可以是一个独立的闪光灯啦！\r\n\r\n![15617079608877331_200967826.png](http://wind.yongkj.cn/static/image/article/1555454315617079608877331_200967826.png)\r\n\r\n拍摄本组照片的闪光灯指数是**1/8秒**，开的比较强，也是为了稍微压制一些投影仪的亮度。\r\n\r\n有时候可能灵感就是一瞬间的迸发。\r\n\r\n相遇的时候，看到小哥哥一头金黄色的头发，突然就临时决定，来一张黄色的色片，简单粗暴地把影子染成金黄色。\r\n\r\n却没想到效果自己还是蛮喜欢的！\r\n\r\n先简单说一下色片哈。\r\n\r\n我个人并不太常用，但也还是有两套放着预备的东西。\r\n\r\n通常就是图上这些。\r\n\r\n![15617079865954252_200967826.png](http://wind.yongkj.cn/static/image/article/1552421215617079865954252_200967826.png)\r\n\r\n![15617079865240895_200967826.png](http://wind.yongkj.cn/static/image/article/1552005115617079865240895_200967826.png)\r\n\r\n使用方法也非常简单，是那种一看就会的**，贴在闪光灯的灯头补位，就能把闪出来的光变成不同的色彩啦**！\r\n\r\n\r\n正好视频捕捉到了按快门一瞬间的金光闪烁，截图给大家看一下……\r\n\r\n色片的威力还是非常强的！\r\n\r\n![15617080166680242_200967826.png](http://wind.yongkj.cn/static/image/article/1553055215617080166680242_200967826.png)\r\n\r\n![15617080165268694_200967826.png](http://wind.yongkj.cn/static/image/article/1554124215617080165268694_200967826.png)\r\n\r\n![15617080349656555_200967826.png](http://wind.yongkj.cn/static/image/article/1511055315617080349656555_200967826.png)\r\n\r\n说这些也是想要带给大家一种思路。\r\n\r\n色片、投影，都是可以组合起来玩的，而且可创造性非常的高~\r\n\r\n接下来也是非常重要的环节。\r\n\r\n前面我们已经有很多思考了，轮到这一步也要仔细慎重呀！\r\n\r\n**什么样子的图片才适合本期的主体呢？**\r\n\r\n答案是**有一定的具象形态，并且是留白较多的墨痕图**。（不是黑白的也没关系，可以PS里调成黑白的）\r\n\r\n![15617080811734526_200967826.png](http://wind.yongkj.cn/static/image/article/1525041315617080811734526_200967826.png)\r\n\r\n因为拍摄当时，就是直接从百度上扒的图片下来，后来也没有保存，现在找不到一模一样的啦，就类似于图上这种，大家理解就行~\r\n\r\n \r\n\r\n“有具体形态的影子，可以提供整个照片的结构支撑”\r\n\r\n \r\n\r\n弧形的影子我用的非常多，很容易形成一种包裹感，即便是入门初学的小伙伴，也是很轻松就能够掌控这类构图的！\r\n\r\n如下图：\r\n\r\n![15617081924245842_200967826.png](http://wind.yongkj.cn/static/image/article/1530353515617081924245842_200967826.png)\r\n\r\n![15617081924604173_200967826.png](http://wind.yongkj.cn/static/image/article/1521545115617081924604173_200967826.png)\r\n\r\n“更多留白，就是更多的想象空间”\r\n\r\n \r\n\r\n影子是无形的，像金色的飞沙一般，也像流动的思绪。\r\n\r\n利用整个影子向左延伸的趋势感，让人物也身体向左边，但头部却略微回头，看向右边的巨大空白之处，通过这种视线引导的方式，平衡了画面左右的重量，同时也有足够的留白，给人更多想象空间。\r\n\r\n如下图：\r\n\r\n![15617082066095954_200967826.png](http://wind.yongkj.cn/static/image/article/1532553415617082066095954_200967826.png)\r\n\r\n\r\n终于可以开始拍啦！简单分享一些拍摄心得吧！\r\n\r\n其实在前面的“色片”部分，也算是简单说了些和影子有关的构图。\r\n\r\n这里再作一些补充~\r\n\r\n \r\n\r\n构图拍摄的想法有千千万，找到适合自己的拍摄节奏，灵感会跟上大脑，会有一种渐入佳境的感觉~\r\n\r\n \r\n\r\n当然，如果是入门的小伙伴，也可以简单记住一些常规的拍摄方法哒！\r\n\r\n \r\n\r\n“手势可以和影子的走势一致！”\r\n\r\n像图中这样，一伸手，刷的一下子，就能流淌出了大片的金色，简直就是中二小伙伴必须尝试的一种玩法呀！\r\n\r\n\r\n![15617082617501440_200967826.png](http://wind.yongkj.cn/static/image/article/1504311315617082617501440_200967826.png)\r\n\r\n“身后的影子才是真正的本尊！”\r\n\r\n好吧我承认，这也是有些中二的拍摄方法~\r\n\r\n让影子沾染一部分在模特的肩头，再延伸到虚空之中，仿佛是某种神秘的力量正在积攒，就等着下一秒打出绝招！\r\n\r\n![15617082954693616_200967826.png](http://wind.yongkj.cn/static/image/article/1500210115617082954693616_200967826.png)\r\n\r\n![15617082967851932_200967826.png](http://wind.yongkj.cn/static/image/article/1555244315617082967851932_200967826.png)\r\n\r\n大概说了四种我在拍摄本组照片时候的想法和构思，希望能作为一个引导的思路给大家呀~\r\n\r\n![15617083483310451_200967826.png](http://wind.yongkj.cn/static/image/article/1513052415617083483310451_200967826.png)\r\n\r\n这组脑洞来自《欧姬芙之花》\r\n\r\n美国艺术家乔治亚·欧姬芙作品中的鲜花常充满着同色调的细微变化，极具韵律美。\r\n\r\n \r\n\r\n这组照片是纯正面投影，由于投影本身选择的就是比较绚烂，仿佛是一种流动的色彩。\r\n\r\n所以就没有再考虑增加色片了~\r\n\r\n这是室内闪光灯片，没有使用投影，但是却运用了三张色片~（奇异的打造出了RGB分离色哈哈哈……）\r\n\r\n人物的影子看起来是有三种颜色的层次感，显得整个片子更加诡谲多变~~\r\n\r\n \r\n\r\n当然，更多更有创意的玩法，也期待大家的进一步挖掘呀~\r\n\r\n \r\n\r\n每周三和周六都会持续更新教程，分享我的拍摄经验~\r\n\r\n下期你们想看哪类教程呢？可以在评论里留言哦！\r\n\r\n', '2021-01-18 00:00:00', '11', '0', '15');
INSERT INTO `tbl_article` VALUES ('26', 'static/image/works/cover/15609250331776338_200967826.jpg', '人像摄影器材指南 | 有这篇人像摄影不用怕！', '', '这是一篇主要讲【**人像镜头焦段**】的推荐，同时我也会简单提及下关于拍摄的相机以及一些平价摄影配件的推荐。希望能对刚刚入门的小伙伴，在甄别镜头方面有所帮助。\r\n\r\n\r\n\r\n其实关于镜头，我比较习惯用大光圈定焦镜头，个人最常用的就是**35/1.4和85/1.2**这两款镜头。自己经常拍摄的色彩情绪类的片子，大多是用35拍摄的；而古风、日常、复古、婚纱类片子，很多时候都会用85拍摄。当然有些时候也会用70200焦段进行拍摄。\r\n\r\n\r\n\r\n总的来说，如果你想要强烈的空气感和画面的干净程度，那必然需要考虑大光圈长焦段；如果想要丰富的构图和张力，就考虑小广角的大光圈镜头吧。\r\n\r\n\r\n\r\n但是我最想说的还是，**器材永远不是决定性因素，最主要的是器材背后的拍摄想法**。我见过许多拿着入门机也能出好片的摄影，然后依靠拍摄技术的不断地进步来匹配合适的设备。虽然很多时候购买这些摄影设备会受资金限制，但是这些相信慢慢的你也一定会有的。\r\n\r\n\r\n\r\n### 定焦镜头之大光圈的选择\r\n\r\n\r\n光圈大意味着更强的虚化和更多的通光。更强的虚化可以带来更柔美的焦外，让焦内主体更加突出，画面更加干净。更大的通光量，意味着低光环境下可以改善明暗。下面我以佳能卡口为例，给大家逐一讲解下。\r\n\r\n\r\n\r\n**1、35mm**\r\n\r\n\r\n\r\n**镜头特点**：视角广、景深大、可多变构图、透视效果大；\r\n\r\n\r\n\r\n**成像特点**：大气、线条明朗；\r\n\r\n\r\n\r\n**镜头缺陷**：特写画面易畸变；\r\n\r\n\r\n\r\n**镜头光圈**：35/1.4与35/2；\r\n\r\n\r\n\r\n35mm，是一颗经典的人像、人文焦段镜头，有着小广角之称。但35mm的广度，并没有广到让人觉得边缘极其不舒服的透视和畸变。它的优势就在于**可以把眼前看到的场景用照片呈现出来**。\r\n\r\n\r\n![15609279642701014_200967826.jpg](http://wind.yongkj.cn/static/image/article/1554242515609279642701014_200967826.jpg)\r\n\r\n### 推荐镜头\r\n\r\n①  佳能( Canon EF 35mm f/1.4L II USM）广角定焦镜头\r\n\r\n\r\n\r\n**镜头价格**：11299左右(35mm镜头中的王者)\r\n\r\n\r\n![15609280048777907_200967826.jpg](http://wind.yongkj.cn/static/image/article/1531210315609280048777907_200967826.jpg)\r\n\r\n\r\n\r\n②  佳能(Canon EF 35mm f/2 IS USMB）镜头\r\n\r\n\r\n\r\n**镜头价格**：3799左右\r\n\r\n\r\n![15609280378740391_200967826.jpg](http://wind.yongkj.cn/static/image/article/1534114115609280378740391_200967826.jpg)\r\n\r\n\r\n\r\n③  适马(SGMA) ART 35mm F1.4 DG HSM\r\n\r\n\r\n\r\n**镜头价格**：4699左右(价格相较于原厂，相同镜头便宜了一大截)\r\n\r\n\r\n\r\n![15609280436002486_200967826.jpg](http://wind.yongkj.cn/static/image/article/1552501215609280436002486_200967826.jpg)\r\n\r\n\r\n**构图方面**\r\n\r\n如果使用横构图，它是一个最适合拍环境人像的镜头。利用透视效果可以把人周围的环境很好的代入进去，远景可以使画面很鲜明。\r\n\r\n\r\n![15609280732524602_200967826.jpg](http://wind.yongkj.cn/static/image/article/1513552215609280732524602_200967826.jpg)\r\n\r\n\r\n\r\n如果使用竖构图，也可以使人物线条更有张力。\r\n\r\n![15609280858107112_200967826.jpg](http://wind.yongkj.cn/static/image/article/1544350015609280858107112_200967826.jpg)\r\n\r\n**远景的使用**\r\n\r\n\r\n它能匹配大多数小场景，如民宿、咖啡厅等室内场景。在户外拍摄的时候，拍摄者与被拍摄者能保持一个正常沟通距离的时候，它是属于可以一镜拍摄全程的镜头。但有点不好的地方，就是**拍特写画面易畸变**。\r\n\r\n\r\n![15609281322995890_200967826.jpg](http://wind.yongkj.cn/static/image/article/1543100015609281322995890_200967826.jpg)\r\n\r\n\r\n\r\n2、85mm \r\n\r\n\r\n\r\n**镜头特点**：空气感强，适合大环境下的拍摄；\r\n\r\n\r\n\r\n**质像特点**：特写质高，原片焦外油润；\r\n\r\n\r\n\r\n**镜头缺陷**：室内拍摄受局限；\r\n\r\n\r\n\r\n**镜头光圈**：85/1.2 、85/1.4 、85/1.8；\r\n\r\n\r\n\r\n85mm，是一个经典的**中长焦人像镜头**。用它拍摄出的画面有着很强的空间压缩感。**它适合在大环境下的拍摄，能很好的把人物从背景中剥离出来**，并带来柔美油润的焦外，使画面更加干净，且因为视角比较窄，更加适合拍摄人物的特写。缺点就是**室内拍摄比较受局限，最好搭配一支小广角使用**。\r\n\r\n![15609281675795665_200967826.jpg](http://wind.yongkj.cn/static/image/article/1533305315609281675795665_200967826.jpg)\r\n\r\n\r\n**推荐镜头**\r\n\r\n\r\n①  佳能（CanonEF 85mm f/1.2L II USM）远摄定焦镜头\r\n\r\n\r\n\r\n**镜头价格**：12499左右（许多人包括我在内都很钟情的一款镜头）\r\n\r\n\r\n\r\n![15609281841159482_200967826.jpg](http://wind.yongkj.cn/static/image/article/1512000315609281841159482_200967826.jpg)\r\n\r\n\r\n\r\n\r\n②  佳能(Canon EF 85mm f/1.4L IS USM）中远摄定焦镜头\r\n\r\n\r\n\r\n**镜头价格**：8999左右\r\n\r\n\r\n![15609282064118623_200967826.jpg](http://wind.yongkj.cn/static/image/article/1544454215609282064118623_200967826.jpg)\r\n\r\n\r\n\r\n③ 佳能(Canon EF 85mm f/1.8 USM）远摄定焦镜头\r\n\r\n\r\n\r\n**镜头价格**：2699左右\r\n\r\n\r\n![15609283232895303_200967826.jpg](http://wind.yongkj.cn/static/image/article/1522102515609283232895303_200967826.jpg)\r\n\r\n\r\n\r\n\r\n④  适马(SGMA) ART 85mm F1.4 DG HSM\r\n\r\n\r\n\r\n**镜头价格**：5799左右（价格相对实惠，性价比比较高）\r\n\r\n\r\n![15609283427059170_200967826.jpg](http://wind.yongkj.cn/static/image/article/1512333115609283427059170_200967826.jpg)\r\n\r\n\r\n3、50mm \r\n\r\n\r\n\r\n**镜头特点**：景深大，视角还原；\r\n\r\n\r\n\r\n**成像特点**：真实还原、构图平和、成像无畸变；\r\n\r\n\r\n\r\n**镜头缺陷**：构图不易出彩；\r\n\r\n\r\n\r\n**镜头光圈**：50/1.8 80/1.4\r\n\r\n\r\n\r\n50mm焦段算是一个分水岭，50mm以下称之为小广角，50mm以上称之为中长焦，所以50mm成像朴实，真实还原，构图平和。\r\n\r\n\r\n\r\n![15609284496816675_200967826.jpg](http://wind.yongkj.cn/static/image/article/1524234115609284496816675_200967826.jpg)\r\n\r\n\r\n**推荐镜头**\r\n\r\n①  佳能（Canon EF 50mm f/1.8 STM）标准定焦镜头\r\n\r\n\r\n\r\n镜头价格：688左右(“小痰盂”，非常适合初学者选用的镜头)\r\n\r\n\r\n![15609284879251555_200967826.jpg](http://wind.yongkj.cn/static/image/article/1500132015609284879251555_200967826.jpg)\r\n\r\n\r\n\r\n②  佳能（Canon EF 50mm f/1.4 USM）标准定焦镜头\r\n\r\n\r\n\r\n镜头价格：2499左右\r\n\r\n\r\n![15609285327447145_200967826.jpg](http://wind.yongkj.cn/static/image/article/1551255215609285327447145_200967826.jpg)\r\n\r\n![15609285973852263_200967826.jpg](http://wind.yongkj.cn/static/image/article/1552032015609285973852263_200967826.jpg)\r\n\r\n\r\n\r\n③ 佳能（Canon EF 50mm f/1.2L USM）标准定焦镜头\r\n\r\n\r\n\r\n镜头价格：8999左右\r\n\r\n\r\n![15609286099302007_200967826.jpg](http://wind.yongkj.cn/static/image/article/1545445115609286099302007_200967826.jpg)\r\n\r\n\r\n\r\n④  适马(SGMA) ART 50mm F1.4 DG HSM\r\n\r\n\r\n\r\n镜头价格：4599左右\r\n\r\n\r\n![15609286319433113_200967826.jpg](http://wind.yongkj.cn/static/image/article/1505504315609286319433113_200967826.jpg)\r\n\r\n\r\n\r\n50mm焦段的镜头没有35mm的那种透视感，也没有85mm那种压缩感和景深。虽不如35mm广，但也可以应付大多数场景，也属于可以一镜拍全程的镜头。而相较于35mm和85mm，**50mm的镜头体积小巧、易携带、价格相对比较低廉**。\r\n\r\n\r\n![15609286544385284_200967826.jpg](http://wind.yongkj.cn/static/image/article/1502210215609286544385284_200967826.jpg)\r\n\r\n\r\n\r\n例如**佳能50mm F1.8小痰盂**，就是一个非常适合初学者选用的镜头，价格低廉，小巧便携。50mm F1.4 焦段镜头，性价比较高，也不昂贵，适用于许多人像拍摄。不过50mm焦段镜头缺陷就是**构图不易出彩，有时候也容易出现跑焦的情况**。\r\n\r\n\r\n\r\n**变焦镜头的选择**\r\n\r\n变焦镜头，相比较定焦镜头一大特点就是**比较方便，适用性也比较强**。但是通常光学素质都不如定焦镜头，且光圈较小，选购时最好选择**变焦大三元**系列，也就是F2.8系列。接下来我还是以佳能卡口为例，给大家逐一讲解下。\r\n\r\n\r\n\r\n**1、16-35mm \r\n**\r\n\r\n\r\n**镜头特点**：夸大前景、退缩远景、拍摄角度大、进光量大、景深大；\r\n\r\n\r\n\r\n**成像特点**：大气、画面广阔；\r\n\r\n\r\n\r\n**镜头缺陷**：不宜拍摄人物特写；\r\n\r\n**推荐镜头**\r\n\r\n①  佳能（Canon EF 16-35mm f/2.8L III USM）广角变焦镜头\r\n\r\n\r\n\r\n**镜头价格**：11699左右\r\n\r\n\r\n![15609287201896162_200967826.jpg](http://wind.yongkj.cn/static/image/article/1524200215609287201896162_200967826.jpg)\r\n\r\n\r\n\r\n②  佳能（Canon EF 16-35mm f/4L IS USM）广角变焦镜头\r\n\r\n\r\n\r\n**镜头价格**：6999左右\r\n\r\n![15609287495299147_200967826.jpg](http://wind.yongkj.cn/static/image/article/1513331315609287495299147_200967826.jpg)\r\n\r\n\r\n\r\n\r\n**16-35mm**，一个**以拍摄广阔风景而生的镜头**，包含了四个比较经典的广角焦段16mm、24mm、28mm、35mm。\r\n\r\n\r\n![15609287848557490_200967826.jpg](http://wind.yongkj.cn/static/image/article/1502241015609287848557490_200967826.jpg)\r\n\r\n\r\n\r\n\r\n超广角焦段，有着强烈的透视和广角畸变，**可以表现气势磅礴画面，也可利用透视，让人物更有气势**。但气势是把双刃剑，构图的时候一定不要把人物的脸放在画面边缘，会影响形象美观。\r\n\r\n\r\n![15609288089934967_200967826.jpg](http://wind.yongkj.cn/static/image/article/1555530315609288089934967_200967826.jpg)\r\n\r\n\r\n\r\n这个焦段的镜头也不易拍摄人物特写，**更适合营造环境氛围**。\r\n\r\n\r\n\r\n**2、24-70mm **\r\n\r\n\r\n\r\n24-70mm变焦，尤其是F2.8光圈，如果预算充足的话，是人们在选择变焦的首选目标。也是**许多人拍摄时一镜到底系列的镜头**，出门有一支它就足够了。\r\n\r\n![15609289012025424_200967826.jpg](http://wind.yongkj.cn/static/image/article/1510302515609289012025424_200967826.jpg)\r\n\r\n优点：它可以拍摄人像、风景、人文，让你的拍摄过程变得相对轻松，很多时候省去换镜头的时间，也可以让你的构图变得更加丰富。\r\n\r\n\r\n\r\n\r\n\r\n\r\n缺点：光圈略小，在某些情况下景深不够，虚化不够好看，成像也不匹配大光圈定焦镜头。但佳能最近出了一支RF 28-70mm F2 的镜头，变焦镜头能做到恒定2.0的光圈确实厉害。\r\n\r\n\r\n\r\n在光圈全开的情况下，画质锐利且焦外柔美，有着不输定焦的画质。有钱不嫌沉的小伙伴可以去尝试一下。\r\n\r\n![15609289319816707_200967826.jpg](http://wind.yongkj.cn/static/image/article/1553321315609289319816707_200967826.jpg)\r\n\r\n\r\n\r\n**推荐镜头**\r\n\r\n①  佳能(Canon) RF28-70mm F2 L USM\r\n\r\n\r\n\r\n**镜头价格**：19378左右\r\n\r\n\r\n![15609290276716921_200967826.jpg](http://wind.yongkj.cn/static/image/article/1553144115609290276716921_200967826.jpg)\r\n\r\n\r\n\r\n②  佳能（Canon EF 24-70mm f/2.8L II USM）标准变焦镜头\r\n\r\n\r\n\r\n**镜头价格**：10900左右\r\n\r\n\r\n![15609289574521675_200967826.jpg](http://wind.yongkj.cn/static/image/article/1531353115609289574521675_200967826.jpg)\r\n\r\n', '2021-01-18 00:00:00', '30', '0', '15');

-- ----------------------------
-- Table structure for `tbl_attention`
-- ----------------------------
DROP TABLE IF EXISTS `tbl_attention`;
CREATE TABLE `tbl_attention` (
  `id` int NOT NULL AUTO_INCREMENT,
  `usertop` int NOT NULL,
  `usernext` int NOT NULL,
  `date_time` varchar(40) CHARACTER SET utf8 COLLATE utf8_czech_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `top` (`usertop`) USING BTREE,
  KEY `next` (`usernext`) USING BTREE,
  CONSTRAINT `tbl_attention_ibfk_1` FOREIGN KEY (`usernext`) REFERENCES `tbl_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tbl_attention_ibfk_2` FOREIGN KEY (`usertop`) REFERENCES `tbl_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_attention
-- ----------------------------
INSERT INTO `tbl_attention` VALUES ('59', '16', '15', '2021-02-16 20:23:46');
INSERT INTO `tbl_attention` VALUES ('60', '15', '16', '2021-02-16 23:37:57');

-- ----------------------------
-- Table structure for `tbl_comment`
-- ----------------------------
DROP TABLE IF EXISTS `tbl_comment`;
CREATE TABLE `tbl_comment` (
  `id` int NOT NULL AUTO_INCREMENT,
  `content` varchar(300) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `date_time` varchar(40) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `userid` int NOT NULL,
  `artid` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user` (`userid`) USING BTREE,
  KEY `art` (`artid`) USING BTREE,
  CONSTRAINT `tbl_comment_ibfk_1` FOREIGN KEY (`artid`) REFERENCES `tbl_article` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tbl_comment_ibfk_2` FOREIGN KEY (`userid`) REFERENCES `tbl_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_comment
-- ----------------------------
INSERT INTO `tbl_comment` VALUES ('19', '又会咁靓嘅', '2021年02月18日', '16', '23');

-- ----------------------------
-- Table structure for `tbl_image`
-- ----------------------------
DROP TABLE IF EXISTS `tbl_image`;
CREATE TABLE `tbl_image` (
  `id` int NOT NULL AUTO_INCREMENT,
  `image` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `works_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `works_id` (`works_id`) USING BTREE,
  CONSTRAINT `tbl_image_ibfk_1` FOREIGN KEY (`works_id`) REFERENCES `tbl_works` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=215 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_image
-- ----------------------------
INSERT INTO `tbl_image` VALUES ('135', 'static/image/works/16087753805652099_200134353.JPG', '51');
INSERT INTO `tbl_image` VALUES ('136', 'static/image/works/16087753807651413_200134353.JPG', '51');
INSERT INTO `tbl_image` VALUES ('137', 'static/image/works/16087753806547336_200134353.JPG', '51');
INSERT INTO `tbl_image` VALUES ('138', 'static/image/works/16087753804155203_200134353.JPG', '51');
INSERT INTO `tbl_image` VALUES ('139', 'static/image/works/n20DUSVsUk8.jpg', '52');
INSERT INTO `tbl_image` VALUES ('140', 'static/image/works/UpWb5udeHfw.jpg', '52');
INSERT INTO `tbl_image` VALUES ('141', 'static/image/works/1L0CtpofE6c.jpg', '52');
INSERT INTO `tbl_image` VALUES ('142', 'static/image/works/L99UKlcUBJY.jpg', '52');
INSERT INTO `tbl_image` VALUES ('143', 'static/image/works/vPOYZac2hiE.jpg', '52');
INSERT INTO `tbl_image` VALUES ('144', 'static/image/works/Zz_3R91RQyo.jpg', '52');
INSERT INTO `tbl_image` VALUES ('145', 'static/image/works/bcyC0eCFH8U.jpg', '53');
INSERT INTO `tbl_image` VALUES ('146', 'static/image/works/1rZcfdsjoR4.jpg', '53');
INSERT INTO `tbl_image` VALUES ('147', 'static/image/works/0D1DkA.jpg', '53');
INSERT INTO `tbl_image` VALUES ('148', 'static/image/works/KzLs2xFMKlU.jpg', '53');
INSERT INTO `tbl_image` VALUES ('149', 'static/image/works/MtyR4vxrt9U.jpg', '53');
INSERT INTO `tbl_image` VALUES ('150', 'static/image/works/1302464085.jpg', '54');
INSERT INTO `tbl_image` VALUES ('151', 'static/image/works/362601800.jpg', '55');
INSERT INTO `tbl_image` VALUES ('152', 'static/image/works/300931903.jpg', '55');
INSERT INTO `tbl_image` VALUES ('153', 'static/image/works/305650692.jpg', '55');
INSERT INTO `tbl_image` VALUES ('154', 'static/image/works/260561702.jpg', '55');
INSERT INTO `tbl_image` VALUES ('155', 'static/image/works/218750256.jpg', '55');
INSERT INTO `tbl_image` VALUES ('156', 'static/image/works/77782013.jpg', '55');
INSERT INTO `tbl_image` VALUES ('157', 'static/image/works/434428876.jpg', '55');
INSERT INTO `tbl_image` VALUES ('158', 'static/image/works/487709228.jpg', '55');
INSERT INTO `tbl_image` VALUES ('159', 'static/image/works/266985482.jpg', '55');
INSERT INTO `tbl_image` VALUES ('160', 'static/image/works/631889121.jpg', '55');
INSERT INTO `tbl_image` VALUES ('161', 'static/image/works/8248191.jpg', '56');
INSERT INTO `tbl_image` VALUES ('162', 'static/image/works/8248190.jpg', '56');
INSERT INTO `tbl_image` VALUES ('163', 'static/image/works/8248189.jpg', '56');
INSERT INTO `tbl_image` VALUES ('164', 'static/image/works/8248192.jpg', '56');
INSERT INTO `tbl_image` VALUES ('165', 'static/image/works/8248266.jpg', '56');
INSERT INTO `tbl_image` VALUES ('166', 'static/image/works/8248195.jpg', '56');
INSERT INTO `tbl_image` VALUES ('167', 'static/image/works/8248188.jpg', '56');
INSERT INTO `tbl_image` VALUES ('168', 'static/image/works/781452614.jpg', '57');
INSERT INTO `tbl_image` VALUES ('169', 'static/image/works/881395022.jpg', '57');
INSERT INTO `tbl_image` VALUES ('170', 'static/image/works/1134036290.jpg', '57');
INSERT INTO `tbl_image` VALUES ('171', 'static/image/works/757007771.jpg', '57');
INSERT INTO `tbl_image` VALUES ('172', 'static/image/works/152231399.jpg', '58');
INSERT INTO `tbl_image` VALUES ('173', 'static/image/works/392945273.jpg', '58');
INSERT INTO `tbl_image` VALUES ('174', 'static/image/works/38330328.jpg', '58');
INSERT INTO `tbl_image` VALUES ('175', 'static/image/works/422502381.jpg', '58');
INSERT INTO `tbl_image` VALUES ('176', 'static/image/works/507371462.jpg', '58');
INSERT INTO `tbl_image` VALUES ('177', 'static/image/works/115005807.jpg', '59');
INSERT INTO `tbl_image` VALUES ('178', 'static/image/works/470540214.jpg', '60');
INSERT INTO `tbl_image` VALUES ('179', 'static/image/works/223338317.jpg', '60');
INSERT INTO `tbl_image` VALUES ('180', 'static/image/works/212197511.jpg', '60');
INSERT INTO `tbl_image` VALUES ('181', 'static/image/works/361488119.jpg', '60');
INSERT INTO `tbl_image` VALUES ('182', 'static/image/works/167104635.jpg', '61');
INSERT INTO `tbl_image` VALUES ('183', 'static/image/works/48550342.jpg', '61');
INSERT INTO `tbl_image` VALUES ('184', 'static/image/works/617140541.jpg', '61');
INSERT INTO `tbl_image` VALUES ('185', 'static/image/works/185520686.jpg', '61');
INSERT INTO `tbl_image` VALUES ('186', 'static/image/works/204460739.jpg', '61');
INSERT INTO `tbl_image` VALUES ('187', 'static/image/works/367579564.jpg', '61');
INSERT INTO `tbl_image` VALUES ('188', 'static/image/works/370921971.jpg', '61');
INSERT INTO `tbl_image` VALUES ('189', 'static/image/works/392941898.jpg', '61');
INSERT INTO `tbl_image` VALUES ('190', 'static/image/works/436720190.jpg', '61');
INSERT INTO `tbl_image` VALUES ('191', 'static/image/works/445895168.jpg', '61');
INSERT INTO `tbl_image` VALUES ('192', 'static/image/works/329765172.jpg', '61');
INSERT INTO `tbl_image` VALUES ('193', 'static/image/works/386584949.jpg', '61');
INSERT INTO `tbl_image` VALUES ('200', 'static/image/works/silence.jpg', '66');
INSERT INTO `tbl_image` VALUES ('201', 'static/image/works/nap.jpg', '66');
INSERT INTO `tbl_image` VALUES ('202', 'static/image/works/A2.jpg', '66');
INSERT INTO `tbl_image` VALUES ('203', 'static/image/works/Emilia.jpg', '66');

-- ----------------------------
-- Table structure for `tbl_response`
-- ----------------------------
DROP TABLE IF EXISTS `tbl_response`;
CREATE TABLE `tbl_response` (
  `id` int NOT NULL AUTO_INCREMENT,
  `response` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `res_time` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `user1_id` int NOT NULL,
  `user2_id` int NOT NULL,
  `comment_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `comment_id` (`comment_id`) USING BTREE,
  KEY `user1` (`user1_id`) USING BTREE,
  KEY `user2` (`user2_id`) USING BTREE,
  CONSTRAINT `tbl_response_ibfk_1` FOREIGN KEY (`comment_id`) REFERENCES `tbl_comment` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tbl_response_ibfk_2` FOREIGN KEY (`user1_id`) REFERENCES `tbl_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tbl_response_ibfk_3` FOREIGN KEY (`user2_id`) REFERENCES `tbl_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_response
-- ----------------------------

-- ----------------------------
-- Table structure for `tbl_user`
-- ----------------------------
DROP TABLE IF EXISTS `tbl_user`;
CREATE TABLE `tbl_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `password` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `birthday` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `sex` varchar(10) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `telephone` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `email` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `qq` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `image` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `persignature` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `perdescription` varchar(800) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_user
-- ----------------------------
INSERT INTO `tbl_user` VALUES ('15', '蜡笔小新', '545d32d2b53534de8fb3064f918c99d8a46f32687d48b609', '1997-01-12', '男', '18879773452', '1159494066@qq.com', '1159494066', 'static/image/153351251302464085.jpg', '啦啦啦啦啦', '需自行自行下载');
INSERT INTO `tbl_user` VALUES ('16', '勇往直前KJ', '179684c6d989034f0b034f3c116450a35456220b9631dc8e', '1998-06-10', '男', '15218480260', '1718874198@qq.com', '1718874198', 'static/image/1653345401cb0c19dbae4c78979148bab45624f8-20_21.jpg', '愿成为自己的光，活得简单知足，不需要太多期盼，依赖与期待', 'Pursue excellence and success will follow.');

-- ----------------------------
-- Table structure for `tbl_workcoll`
-- ----------------------------
DROP TABLE IF EXISTS `tbl_workcoll`;
CREATE TABLE `tbl_workcoll` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userid` int NOT NULL,
  `workid` int NOT NULL,
  `date_time` varchar(40) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `flag` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `workuserid` (`userid`) USING BTREE,
  KEY `work_id` (`workid`) USING BTREE,
  CONSTRAINT `tbl_workcoll_ibfk_1` FOREIGN KEY (`workid`) REFERENCES `tbl_works` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tbl_workcoll_ibfk_2` FOREIGN KEY (`userid`) REFERENCES `tbl_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_workcoll
-- ----------------------------
INSERT INTO `tbl_workcoll` VALUES ('23', '16', '57', '2021-02-16 20:23:45', '1');
INSERT INTO `tbl_workcoll` VALUES ('25', '15', '66', '2021-02-17 01:55:47', '1');

-- ----------------------------
-- Table structure for `tbl_workcomment`
-- ----------------------------
DROP TABLE IF EXISTS `tbl_workcomment`;
CREATE TABLE `tbl_workcomment` (
  `id` int NOT NULL AUTO_INCREMENT,
  `content` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `date_time` varchar(40) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `user_id` int NOT NULL,
  `work_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `usersid` (`user_id`) USING BTREE,
  KEY `worksid` (`work_id`) USING BTREE,
  CONSTRAINT `tbl_workcomment_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `tbl_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tbl_workcomment_ibfk_2` FOREIGN KEY (`work_id`) REFERENCES `tbl_works` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_workcomment
-- ----------------------------

-- ----------------------------
-- Table structure for `tbl_works`
-- ----------------------------
DROP TABLE IF EXISTS `tbl_works`;
CREATE TABLE `tbl_works` (
  `id` int NOT NULL AUTO_INCREMENT,
  `works_title` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `classify` varchar(10) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `works_describe` varchar(400) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `tag` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `date_time` varchar(40) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `glance` int NOT NULL,
  `praise` int NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`) USING BTREE,
  CONSTRAINT `tbl_works_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `tbl_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=74 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_works
-- ----------------------------
INSERT INTO `tbl_works` VALUES ('51', '绿 之 生 机 ', '生态', '万物最爱那一抹绿\n\n摄影师镜头里的绿色来得生机勃勃 就像春天再次降临追光者', '绿意盎然', '2021-01-18 00:00:00', '7', '0', '15');
INSERT INTO `tbl_works` VALUES ('52', '我是天空里的一片云', '风景', '云，你行过春的得意盎然，\n经过夏的躁动浮华，\n秋至，败却化为历掠人间百态，\n谙熟命途多舛的中年男子，\n穿过浪漫站立在我面前，\n坚强到青春下的沧桑满面', '魔挂苍穹,五彩缤纷,变幻无常,自由飘扬', '2021-01-18 00:00:00', '2', '0', '15');
INSERT INTO `tbl_works` VALUES ('53', '你的足迹', '风景', '寻着你的足迹，跋涉千里，仅管一路风雨，却也觉得芳草鲜美，落英缤纷。你递过的浅浅微笑，足以抚去一路风尘。在花开时节，执子之手。这温玉般的感觉恰如你我才初初相遇。', '小路实笃,曲折小路', '2021-01-18 00:00:00', '0', '0', '15');
INSERT INTO `tbl_works` VALUES ('54', '野球少年', '人像', '胶片第一卷', '日系摄影', '2021-02-09 20:45:02', '6', '0', '15');
INSERT INTO `tbl_works` VALUES ('55', '心存善意，定能途遇天使。', '生活', '信仰欲望，花落草长', '街头故事家,园林摄影', '2021-02-09 20:50:28', '2', '0', '15');
INSERT INTO `tbl_works` VALUES ('56', '雪国', '风景', '', '极简色彩,黑白大片', '2021-02-09 20:59:44', '0', '0', '15');
INSERT INTO `tbl_works` VALUES ('57', '洛杉矶2020', '生活', '我们这群拍海人~~', '海岸,洛杉矶', '2021-02-09 21:04:14', '3', '0', '15');
INSERT INTO `tbl_works` VALUES ('58', '尤尔根·泰勒：不被时尚束缚的时尚摄影', '纪实', '时尚摄影师尤尔根·泰勒擅于将平凡元素与精英主义的形象融合在一起，他拍的肖像少有艳丽的色彩和夸张的元素，呈现一种坦诚。这突破了当时时尚摄影既定框架的束缚，模糊额商业与艺术的边界。', '摄影纪实', '2021-02-09 21:15:47', '1', '0', '15');
INSERT INTO `tbl_works` VALUES ('59', '2020best9', '风景', '这一年虽然魔幻，但依然坚持寻找和记录美好，这是摄影让人感动的地方。新的一年，希望阴霾都能散去，多出门，多出片！', '红墙银杏', '2021-02-09 22:48:30', '1', '0', '15');
INSERT INTO `tbl_works` VALUES ('60', '盖·伯丁：挑衅离奇的时尚摄影', '观念', '盖·伯丁（Guy Bourdin）被认为是20世纪下半叶最成功的时尚摄影师之一，他为《Vogue》、《Harper\'s Bazaar》等许多时尚出版物拍摄广告，他那充满魅力和活力，又极具挑衅意味的照片，影响了无数后来的摄影者。', '时尚摄影', '2021-02-09 22:53:27', '0', '0', '15');
INSERT INTO `tbl_works` VALUES ('61', 'Someday or One Day', '人像', '', '小清新,室内摄影', '2021-02-09 23:02:02', '3', '0', '15');
INSERT INTO `tbl_works` VALUES ('66', '鬼刀2k-4k高清壁纸', '其他', '鬼刀作品', '鬼刀,高清,唯美,壁纸', '2021-02-16 21:14:15', '10', '0', '16');
