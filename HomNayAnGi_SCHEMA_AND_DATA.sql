USE [master]
GO
/****** Object:  Database [HomNayAnGi]    Script Date: 11/9/2024 9:55:36 AM ******/
CREATE DATABASE [HomNayAnGi]
GO
ALTER DATABASE [HomNayAnGi] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [HomNayAnGi] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [HomNayAnGi] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [HomNayAnGi] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [HomNayAnGi] SET ARITHABORT OFF 
GO
ALTER DATABASE [HomNayAnGi] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [HomNayAnGi] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [HomNayAnGi] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [HomNayAnGi] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [HomNayAnGi] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [HomNayAnGi] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [HomNayAnGi] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [HomNayAnGi] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [HomNayAnGi] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [HomNayAnGi] SET  ENABLE_BROKER 
GO
ALTER DATABASE [HomNayAnGi] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [HomNayAnGi] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [HomNayAnGi] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [HomNayAnGi] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [HomNayAnGi] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [HomNayAnGi] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [HomNayAnGi] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [HomNayAnGi] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [HomNayAnGi] SET  MULTI_USER 
GO
ALTER DATABASE [HomNayAnGi] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [HomNayAnGi] SET DB_CHAINING OFF 
GO
ALTER DATABASE [HomNayAnGi] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [HomNayAnGi] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [HomNayAnGi] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [HomNayAnGi] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [HomNayAnGi] SET QUERY_STORE = ON
GO
ALTER DATABASE [HomNayAnGi] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [HomNayAnGi]
GO
/****** Object:  Table [dbo].[Ingredient]    Script Date: 11/9/2024 9:55:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ingredient](
	[IngredientId] [int] IDENTITY(1,1) NOT NULL,
	[IngredientName] [nvarchar](255) NOT NULL,
	[Description] [nvarchar](max) NULL,
	[CreatedBy] [int] NULL,
 CONSTRAINT [Ingredient_pk] PRIMARY KEY CLUSTERED 
(
	[IngredientId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Meal]    Script Date: 11/9/2024 9:55:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Meal](
	[MealId] [int] IDENTITY(1,1) NOT NULL,
	[MealName] [nvarchar](100) NOT NULL,
 CONSTRAINT [Meal_pk] PRIMARY KEY CLUSTERED 
(
	[MealId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NutritionFact]    Script Date: 11/9/2024 9:55:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NutritionFact](
	[RecipeId] [int] NOT NULL,
	[Calories] [float] NULL,
	[Protein] [float] NULL,
	[Fat] [float] NULL,
	[Carbohydrates] [float] NULL,
	[Fiber] [float] NULL,
	[Sugar] [float] NULL,
 CONSTRAINT [NutritionFact_pk] PRIMARY KEY CLUSTERED 
(
	[RecipeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Recipe]    Script Date: 11/9/2024 9:55:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Recipe](
	[RecipeId] [int] IDENTITY(1,1) NOT NULL,
	[CategoryId] [int] NULL,
	[RecipeName] [nvarchar](255) NOT NULL,
	[Description] [nvarchar](max) NULL,
	[CookTime] [int] NULL,
	[PrepTime] [int] NULL,
	[Servings] [int] NULL,
	[DifficultyLevel] [nvarchar](10) NULL,
	[UserId] [int] NULL,
	[CreatedAt] [datetime] NULL,
	[UpdatedAt] [datetime] NULL,
	[Image] [nvarchar](max) NULL,
	[Video] [nvarchar](max) NULL,
	[IsPublic] [int] NOT NULL,
 CONSTRAINT [Recipe_pk] PRIMARY KEY CLUSTERED 
(
	[RecipeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RecipeCategory]    Script Date: 11/9/2024 9:55:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RecipeCategory](
	[CategoryId] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [nvarchar](255) NOT NULL,
	[CreatedBy] [int] NULL,
 CONSTRAINT [RecipeCategory_pk] PRIMARY KEY CLUSTERED 
(
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RecipeComment]    Script Date: 11/9/2024 9:55:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RecipeComment](
	[CommentId] [int] IDENTITY(1,1) NOT NULL,
	[RecipeId] [int] NULL,
	[UserId] [int] NULL,
	[Comment] [nvarchar](max) NULL,
	[Rating] [int] NULL,
	[CreatedAt] [datetime] NULL,
	[ParentCommentId] [int] NULL,
 CONSTRAINT [RecipeComment_pk] PRIMARY KEY CLUSTERED 
(
	[CommentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RecipeIngredient]    Script Date: 11/9/2024 9:55:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RecipeIngredient](
	[RecipeIngredientId] [int] IDENTITY(1,1) NOT NULL,
	[RecipeId] [int] NOT NULL,
	[IngredientId] [int] NOT NULL,
	[Quantity] [float] NULL,
	[Unit] [nvarchar](50) NULL,
 CONSTRAINT [RecipeIngredient_pk] PRIMARY KEY CLUSTERED 
(
	[RecipeIngredientId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RecipeMeal]    Script Date: 11/9/2024 9:55:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RecipeMeal](
	[RecipeMealId] [int] IDENTITY(1,1) NOT NULL,
	[MealId] [int] NOT NULL,
	[RecipeId] [int] NOT NULL,
 CONSTRAINT [RecipeMeal_pk] PRIMARY KEY CLUSTERED 
(
	[RecipeMealId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RecipeStep]    Script Date: 11/9/2024 9:55:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RecipeStep](
	[StepId] [int] IDENTITY(1,1) NOT NULL,
	[RecipeId] [int] NULL,
	[StepNumber] [int] NULL,
	[Instruction] [nvarchar](max) NULL,
 CONSTRAINT [RecipeStep_pk] PRIMARY KEY CLUSTERED 
(
	[StepId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SignupOTP]    Script Date: 11/9/2024 9:55:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SignupOTP](
	[SignupRequestId] [varchar](100) NOT NULL,
	[OTPString] [varchar](10) NOT NULL,
	[RequestAttemptsRemains] [int] NOT NULL,
	[ExpiresAt] [datetime] NOT NULL,
 CONSTRAINT [SignupOTP_pk] PRIMARY KEY CLUSTERED 
(
	[SignupRequestId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StepImage]    Script Date: 11/9/2024 9:55:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StepImage](
	[StepImageId] [int] IDENTITY(1,1) NOT NULL,
	[StepId] [int] NOT NULL,
	[ImageLink] [nvarchar](max) NOT NULL,
 CONSTRAINT [StepImage_pk] PRIMARY KEY CLUSTERED 
(
	[StepImageId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 11/9/2024 9:55:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[Username] [nvarchar](255) NOT NULL,
	[Email] [nvarchar](255) NULL,
	[Password] [nvarchar](255) NOT NULL,
	[CreatedAt] [datetime] NULL,
	[Role] [varchar](100) NOT NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [User_pk] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserFavorite]    Script Date: 11/9/2024 9:55:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserFavorite](
	[UserFavoriteId] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[RecipeId] [int] NOT NULL,
 CONSTRAINT [UserFavorite_pk] PRIMARY KEY CLUSTERED 
(
	[UserFavoriteId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserRefreshToken]    Script Date: 11/9/2024 9:55:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserRefreshToken](
	[UserRefreshTokenId] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[RefreshToken] [nvarchar](max) NULL,
	[CreatedAt] [datetime] NULL,
	[ExpiresAt] [datetime] NULL,
	[DeviceID] [nvarchar](max) NULL,
 CONSTRAINT [UserRefreshToken_pk] PRIMARY KEY CLUSTERED 
(
	[UserRefreshTokenId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Ingredient] ON 

INSERT [dbo].[Ingredient] ([IngredientId], [IngredientName], [Description], [CreatedBy]) VALUES (2, N'Đường1', N'Nguyên liệu tạo ngọt, thường dùng trong món tráng miệng và đồ uống.', NULL)
INSERT [dbo].[Ingredient] ([IngredientId], [IngredientName], [Description], [CreatedBy]) VALUES (3, N'Nước mắm', N'Gia vị truyền thống của Việt Nam, được lên men từ cá và muối.', NULL)
INSERT [dbo].[Ingredient] ([IngredientId], [IngredientName], [Description], [CreatedBy]) VALUES (4, N'Hành lá', N'Rau thơm thường dùng để trang trí và tăng hương vị cho món ăn.', NULL)
INSERT [dbo].[Ingredient] ([IngredientId], [IngredientName], [Description], [CreatedBy]) VALUES (5, N'Tỏi', N'Nguyên liệu có hương vị mạnh, thường được phi thơm trong nhiều món xào.', NULL)
INSERT [dbo].[Ingredient] ([IngredientId], [IngredientName], [Description], [CreatedBy]) VALUES (6, N'Gừng', N'Thường dùng để tạo hương thơm và vị cay nhẹ cho các món ăn.', 18)
INSERT [dbo].[Ingredient] ([IngredientId], [IngredientName], [Description], [CreatedBy]) VALUES (7, N'Sả', N'Nguyên liệu có mùi thơm đặc trưng, dùng nhiều trong món nướng và kho.', 18)
INSERT [dbo].[Ingredient] ([IngredientId], [IngredientName], [Description], [CreatedBy]) VALUES (8, N'Ớt', N'Gia vị cay, thường được dùng để tăng vị cho món ăn.', NULL)
INSERT [dbo].[Ingredient] ([IngredientId], [IngredientName], [Description], [CreatedBy]) VALUES (9, N'Thịt heo', N'Nguồn protein phổ biến, thường được chế biến thành các món luộc, xào, kho.', NULL)
INSERT [dbo].[Ingredient] ([IngredientId], [IngredientName], [Description], [CreatedBy]) VALUES (10, N'Thịt bò', N'Nguyên liệu chính cho nhiều món ăn như bò kho, phở.', NULL)
INSERT [dbo].[Ingredient] ([IngredientId], [IngredientName], [Description], [CreatedBy]) VALUES (11, N'Rau muống', N'Loại rau xanh phổ biến, thường dùng trong món luộc hoặc xào.', NULL)
INSERT [dbo].[Ingredient] ([IngredientId], [IngredientName], [Description], [CreatedBy]) VALUES (12, N'Bột ngọt', N'Chất điều vị, giúp tăng hương vị cho món ăn.', NULL)
INSERT [dbo].[Ingredient] ([IngredientId], [IngredientName], [Description], [CreatedBy]) VALUES (13, N'Dầu ăn', N'Dầu thực vật, dùng để chiên, xào các món ăn.', NULL)
INSERT [dbo].[Ingredient] ([IngredientId], [IngredientName], [Description], [CreatedBy]) VALUES (14, N'Cà chua', N'Nguyên liệu chính trong nhiều món canh và xào.', NULL)
INSERT [dbo].[Ingredient] ([IngredientId], [IngredientName], [Description], [CreatedBy]) VALUES (15, N'Nấm rơm', N'Loại nấm thường dùng trong món lẩu, canh, và xào.', NULL)
INSERT [dbo].[Ingredient] ([IngredientId], [IngredientName], [Description], [CreatedBy]) VALUES (16, N'Rau răm', N'Rau thơm có mùi nồng, thường dùng với các món hải sản và trứng vịt lộn.', NULL)
INSERT [dbo].[Ingredient] ([IngredientId], [IngredientName], [Description], [CreatedBy]) VALUES (17, N'Đậu hũ', N'Nguồn protein thực vật, thường dùng trong món chay và canh.', NULL)
INSERT [dbo].[Ingredient] ([IngredientId], [IngredientName], [Description], [CreatedBy]) VALUES (18, N'Trứng gà', N'Nguyên liệu phổ biến trong nhiều món ăn như chiên, luộc, và nấu canh.', NULL)
INSERT [dbo].[Ingredient] ([IngredientId], [IngredientName], [Description], [CreatedBy]) VALUES (19, N'Hành tím', N'Thường được phi thơm, dùng để tăng hương vị cho các món ăn.', NULL)
INSERT [dbo].[Ingredient] ([IngredientId], [IngredientName], [Description], [CreatedBy]) VALUES (20, N'Mắm tôm', N'Gia vị đặc trưng của ẩm thực miền Bắc Việt Nam, thường ăn kèm với bún đậu và nhiều món khác.', NULL)
INSERT [dbo].[Ingredient] ([IngredientId], [IngredientName], [Description], [CreatedBy]) VALUES (28, N'Xúc xích', N'Gia vị đặc trưng của ẩm thực miền Bắc Việt Nam, thường ăn kèm với bún đậu và nhiều món khác.', 1)
INSERT [dbo].[Ingredient] ([IngredientId], [IngredientName], [Description], [CreatedBy]) VALUES (29, N'Lươn', N'Gia vị đặc trưng của ẩm thực miền Bắc Việt Nam, thường ăn kèm với bún đậu và nhiều món khác.', 1)
INSERT [dbo].[Ingredient] ([IngredientId], [IngredientName], [Description], [CreatedBy]) VALUES (30, N'Cơm nguội', N'Gia vị đặc trưng của ẩm thực miền Bắc Việt Nam, thường ăn kèm với bún đậu và nhiều món khác.', 1)
INSERT [dbo].[Ingredient] ([IngredientId], [IngredientName], [Description], [CreatedBy]) VALUES (31, N'Mỳ tôm', N'Gia vị đặc trưng của ẩm thực miền Bắc Việt Nam, thường ăn kèm với bún đậu và nhiều món khác.', 8)
INSERT [dbo].[Ingredient] ([IngredientId], [IngredientName], [Description], [CreatedBy]) VALUES (32, N'Rau ngót', N'Gia vị đặc trưng của ẩm thực miền Bắc Việt Nam, thường ăn kèm với bún đậu và nhiều món khác.', 10)
INSERT [dbo].[Ingredient] ([IngredientId], [IngredientName], [Description], [CreatedBy]) VALUES (33, N'Thịt heo băm', N'Gia vị đặc trưng của ẩm thực miền Bắc Việt Nam, thường ăn kèm với bún đậu và nhiều món khác.', 10)
INSERT [dbo].[Ingredient] ([IngredientId], [IngredientName], [Description], [CreatedBy]) VALUES (34, N'Hành khô', N'Gia vị đặc trưng của ẩm thực miền Bắc Việt Nam, thường ăn kèm với bún đậu và nhiều món khác.', 10)
INSERT [dbo].[Ingredient] ([IngredientId], [IngredientName], [Description], [CreatedBy]) VALUES (52, N'Hiep', NULL, 1)
INSERT [dbo].[Ingredient] ([IngredientId], [IngredientName], [Description], [CreatedBy]) VALUES (56, N'Tuấn Anh', NULL, 1)
INSERT [dbo].[Ingredient] ([IngredientId], [IngredientName], [Description], [CreatedBy]) VALUES (60, N'Gạo', NULL, 1)
SET IDENTITY_INSERT [dbo].[Ingredient] OFF
GO
SET IDENTITY_INSERT [dbo].[Meal] ON 

INSERT [dbo].[Meal] ([MealId], [MealName]) VALUES (1, N'Bữa sáng')
INSERT [dbo].[Meal] ([MealId], [MealName]) VALUES (2, N'Bữa trưa')
INSERT [dbo].[Meal] ([MealId], [MealName]) VALUES (3, N'Bữa tối')
INSERT [dbo].[Meal] ([MealId], [MealName]) VALUES (4, N'Ăn vặt')
SET IDENTITY_INSERT [dbo].[Meal] OFF
GO
INSERT [dbo].[NutritionFact] ([RecipeId], [Calories], [Protein], [Fat], [Carbohydrates], [Fiber], [Sugar]) VALUES (1, 2, 2, 0, 0, 0, 0)
INSERT [dbo].[NutritionFact] ([RecipeId], [Calories], [Protein], [Fat], [Carbohydrates], [Fiber], [Sugar]) VALUES (47, 1, 5, 5, 2, 2, 9)
INSERT [dbo].[NutritionFact] ([RecipeId], [Calories], [Protein], [Fat], [Carbohydrates], [Fiber], [Sugar]) VALUES (57, 1, 1, 1, 0, 0, 0)
INSERT [dbo].[NutritionFact] ([RecipeId], [Calories], [Protein], [Fat], [Carbohydrates], [Fiber], [Sugar]) VALUES (89, 34, 5, NULL, NULL, NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[Recipe] ON 

INSERT [dbo].[Recipe] ([RecipeId], [CategoryId], [RecipeName], [Description], [CookTime], [PrepTime], [Servings], [DifficultyLevel], [UserId], [CreatedAt], [UpdatedAt], [Image], [Video], [IsPublic]) VALUES (1, 1, N'Phở bò', N'Món phở truyền thống với nuớc dùng bò đậm dà.', 60, 30, 4, N'Medium', 1, CAST(N'2024-10-29T15:08:54.483' AS DateTime), CAST(N'2024-10-29T15:08:54.483' AS DateTime), N'https://tiki.vn/blog/wp-content/uploads/2023/07/thumb-12.jpg', NULL, 1)
INSERT [dbo].[Recipe] ([RecipeId], [CategoryId], [RecipeName], [Description], [CookTime], [PrepTime], [Servings], [DifficultyLevel], [UserId], [CreatedAt], [UpdatedAt], [Image], [Video], [IsPublic]) VALUES (2, 2, N'Bún Chả', N'Bún thịt nướng kiểu Hà Nội, kèm nước mắm pha.






', 45, 20, 3, N'Medium', 2, CAST(N'2024-10-29T15:08:54.483' AS DateTime), CAST(N'2024-10-29T15:08:54.483' AS DateTime), N'https://vcdn1-giadinh.vnecdn.net/2021/01/08/Anh-2-8146-1610099449.jpg?w=460&h=0&q=100&dpr=2&fit=crop&s=sQNPaScgfMKYM7nJJEMJUQ', NULL, 1)
INSERT [dbo].[Recipe] ([RecipeId], [CategoryId], [RecipeName], [Description], [CookTime], [PrepTime], [Servings], [DifficultyLevel], [UserId], [CreatedAt], [UpdatedAt], [Image], [Video], [IsPublic]) VALUES (3, 3, N'Gỏi Cuốn', N'Món cuốn nhẹ nhàng, bao gồm tôm, thịt và rau sống.', 15, 10, 4, N'Easy', 3, CAST(N'2024-10-29T15:08:54.483' AS DateTime), CAST(N'2024-10-29T15:08:54.483' AS DateTime), N'https://upload.wikimedia.org/wikipedia/commons/0/01/Goi_Cuon_VN.jpg', NULL, 1)
INSERT [dbo].[Recipe] ([RecipeId], [CategoryId], [RecipeName], [Description], [CookTime], [PrepTime], [Servings], [DifficultyLevel], [UserId], [CreatedAt], [UpdatedAt], [Image], [Video], [IsPublic]) VALUES (4, 2, N'Bánh Xèo', N'Bánh xèo giòn với nhân tôm thịt, ăn kèm rau sống và nước mắm.


', 30, 15, 4, N'Medium', 4, CAST(N'2024-10-29T15:08:54.483' AS DateTime), CAST(N'2024-10-29T15:08:54.483' AS DateTime), N'https://ik.imagekit.io/tvlk/blog/2022/08/banh-xeo-dac-san-o-dau-3.jpeg?tr=c-at_max?tr=c-at_max', NULL, 1)
INSERT [dbo].[Recipe] ([RecipeId], [CategoryId], [RecipeName], [Description], [CookTime], [PrepTime], [Servings], [DifficultyLevel], [UserId], [CreatedAt], [UpdatedAt], [Image], [Video], [IsPublic]) VALUES (6, 6, N'Chả Giò', N'Món chả giò giòn rụm, ăn kèm rau sống và nước chấm.






', 30, 20, 5, N'Medium', 2, CAST(N'2024-10-29T15:08:54.483' AS DateTime), CAST(N'2024-10-29T15:08:54.483' AS DateTime), N'https://assets.unileversolutions.com/recipes-v2/157768.jpg', NULL, 1)
INSERT [dbo].[Recipe] ([RecipeId], [CategoryId], [RecipeName], [Description], [CookTime], [PrepTime], [Servings], [DifficultyLevel], [UserId], [CreatedAt], [UpdatedAt], [Image], [Video], [IsPublic]) VALUES (7, 1, N'Canh Chua Cá', N'Canh chua đậm đà với cá và rau quả, vị chua ngọt hài hòa.






', 25, 10, 4, N'Medium', 3, CAST(N'2024-10-29T15:08:54.483' AS DateTime), CAST(N'2024-10-29T15:08:54.483' AS DateTime), N'https://i-giadinh.vnecdn.net/2021/03/19/ca2-1616122035-2163-1616122469.jpg', NULL, 1)
INSERT [dbo].[Recipe] ([RecipeId], [CategoryId], [RecipeName], [Description], [CookTime], [PrepTime], [Servings], [DifficultyLevel], [UserId], [CreatedAt], [UpdatedAt], [Image], [Video], [IsPublic]) VALUES (8, 2, N'Bánh Cuốn', N'Canh chua đậm đà với cá và rau quả, vị chua ngọt hài hòa.






', 20, 15, 3, N'Easy', 4, CAST(N'2024-10-29T15:08:54.483' AS DateTime), CAST(N'2024-10-29T15:08:54.483' AS DateTime), N'https://upload.wikimedia.org/wikipedia/commons/thumb/8/8c/Banh_Cuon_VN.jpg/640px-Banh_Cuon_VN.jpg', NULL, 1)
INSERT [dbo].[Recipe] ([RecipeId], [CategoryId], [RecipeName], [Description], [CookTime], [PrepTime], [Servings], [DifficultyLevel], [UserId], [CreatedAt], [UpdatedAt], [Image], [Video], [IsPublic]) VALUES (10, 4, N'Mì Quảng', N'Mì Quảng với nước dùng sệt, ăn kèm tôm, thịt và bánh đa.






', 50, 20, 4, N'Medium', 2, CAST(N'2024-10-29T15:08:54.483' AS DateTime), CAST(N'2024-10-29T15:08:54.483' AS DateTime), N'https://cdn.tgdd.vn/2021/02/CookProduct/1200-1200x676-16.jpg', NULL, 1)
INSERT [dbo].[Recipe] ([RecipeId], [CategoryId], [RecipeName], [Description], [CookTime], [PrepTime], [Servings], [DifficultyLevel], [UserId], [CreatedAt], [UpdatedAt], [Image], [Video], [IsPublic]) VALUES (15, 2, N'Gà luộc', N'Gà luộc chín thái độ', 60, 15, 2, N'Khó', 1, CAST(N'2024-10-29T17:58:04.110' AS DateTime), CAST(N'2024-10-29T17:58:04.110' AS DateTime), N'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ6DVxEfOs4voFwDAiC1W3c5Te8xepSYR3BLg&s', NULL, 1)
INSERT [dbo].[Recipe] ([RecipeId], [CategoryId], [RecipeName], [Description], [CookTime], [PrepTime], [Servings], [DifficultyLevel], [UserId], [CreatedAt], [UpdatedAt], [Image], [Video], [IsPublic]) VALUES (20, 1, N'Bánh Khọt Vũng Tàu', N'Bánh khọt giòn, nhân tôm ngọt, ăn kèm rau và nước mắm.






', 9, 785, 2, N'Khó', 1, CAST(N'2024-10-29T18:08:06.573' AS DateTime), CAST(N'2024-10-29T18:08:06.573' AS DateTime), N'https://bazantravel.com/cdn/medias/uploads/82/82520-banh-khot-vung-tau-700x700.jpg', NULL, 1)
INSERT [dbo].[Recipe] ([RecipeId], [CategoryId], [RecipeName], [Description], [CookTime], [PrepTime], [Servings], [DifficultyLevel], [UserId], [CreatedAt], [UpdatedAt], [Image], [Video], [IsPublic]) VALUES (21, 3, N'Nem Nướng Nha Trang', N'Nem nướng thơm lừng, chấm cùng nước chấm đặc biệt từ đậu phộng xay nhuyễn, ăn kèm rau sống và bánh tráng giòn.', 20, 720, 3, N'Khó', 1, CAST(N'2024-10-29T18:08:52.780' AS DateTime), CAST(N'2024-10-29T18:08:52.780' AS DateTime), N'https://cdn.tgdd.vn/2021/09/CookDish/cach-lam-nem-nuong-nha-trang-bang-noi-chien-khong-dau-thom-avt-1200x676.jpg', NULL, 1)
INSERT [dbo].[Recipe] ([RecipeId], [CategoryId], [RecipeName], [Description], [CookTime], [PrepTime], [Servings], [DifficultyLevel], [UserId], [CreatedAt], [UpdatedAt], [Image], [Video], [IsPublic]) VALUES (23, 29, N'Hủ Tiếu Nam Vang Đặc Biệt', N'Hủ tiếu dai ngon, thịt tôm mực trứng cút, nước dùng thanh.






', 60, 120, 5, N'Khó', 1, CAST(N'2024-10-29T19:11:01.280' AS DateTime), CAST(N'2024-10-29T19:11:01.280' AS DateTime), N'https://barona.vn/storage/cong-thuc/hu-tieu-nam-vang.jpeg', NULL, 1)
INSERT [dbo].[Recipe] ([RecipeId], [CategoryId], [RecipeName], [Description], [CookTime], [PrepTime], [Servings], [DifficultyLevel], [UserId], [CreatedAt], [UpdatedAt], [Image], [Video], [IsPublic]) VALUES (46, 21, N'Bánh Canh Cua Sài Gòn', N'Bánh canh cua thơm ngon với nước dùng sánh mịn, hương vị đậm đà từ cua tươi, kết hợp với chả và trứng cút hấp dẫn.', 60, 30, 3, N'Trung bình', 1, CAST(N'2024-10-30T14:12:52.760' AS DateTime), CAST(N'2024-10-30T14:12:52.760' AS DateTime), N'https://gofood.vn//uploads/san-pham/Hai-san-nhat-ban/hai-san-moi/luon-nhat-unagi-4.jpg', NULL, 0)
INSERT [dbo].[Recipe] ([RecipeId], [CategoryId], [RecipeName], [Description], [CookTime], [PrepTime], [Servings], [DifficultyLevel], [UserId], [CreatedAt], [UpdatedAt], [Image], [Video], [IsPublic]) VALUES (47, 21, N'Bún Riêu Cua Thanh Mát', N'Nước dùng chua nhẹ, thơm cua đồng, kết hợp cà chua, đậu hũ, hành phi, mắm tôm, đậm đà khó quên.







', 60, 30, 5, N'Khó', 1, CAST(N'2024-10-30T14:16:08.987' AS DateTime), CAST(N'2024-10-30T14:16:08.987' AS DateTime), N'https://cdn.tgdd.vn/Files/2022/11/23/1489497/cach-nau-sup-luon-thom-ngon-bo-duong-chuan-vi-nghe-an-202211230740380484.jpg', NULL, 0)
INSERT [dbo].[Recipe] ([RecipeId], [CategoryId], [RecipeName], [Description], [CookTime], [PrepTime], [Servings], [DifficultyLevel], [UserId], [CreatedAt], [UpdatedAt], [Image], [Video], [IsPublic]) VALUES (49, 6, N'Mỳ trộn', N'Mỳ trộn là món ăn nhanh gọn, kết hợp mỳ mềm dai với nước sốt đậm đà từ xì dầu, dầu hào, và tương ớt. Thêm rau thơm, hành phi, đậu phộng rang để tăng hương vị. ', 15, 5, 3, N'Dễ', 8, CAST(N'2024-10-30T17:10:27.273' AS DateTime), CAST(N'2024-10-30T17:10:27.273' AS DateTime), N'https://cdn.tgdd.vn/2021/07/CookProduct/mitrontrunglongdao-1200x676.jpg', NULL, 1)
INSERT [dbo].[Recipe] ([RecipeId], [CategoryId], [RecipeName], [Description], [CookTime], [PrepTime], [Servings], [DifficultyLevel], [UserId], [CreatedAt], [UpdatedAt], [Image], [Video], [IsPublic]) VALUES (50, NULL, N'Gà Hấp Muối Sả', N'Gà hấp muối sả, da giòn, thịt mềm, ăn kèm muối tiêu chanh.






', 50, 60, 5, N'Dễ', 8, CAST(N'2024-10-30T17:37:22.557' AS DateTime), CAST(N'2024-10-30T17:37:22.557' AS DateTime), N'https://img-global.cpcdn.com/recipes/55f5201150f9bcc6/680x482cq70/ga-h%E1%BA%A5p-mu%E1%BB%91i-s%E1%BA%A3-la-chanh-phien-b%E1%BA%A3n-m%E1%BB%9Bi-recipe-main-photo.jpg', NULL, 0)
INSERT [dbo].[Recipe] ([RecipeId], [CategoryId], [RecipeName], [Description], [CookTime], [PrepTime], [Servings], [DifficultyLevel], [UserId], [CreatedAt], [UpdatedAt], [Image], [Video], [IsPublic]) VALUES (57, 3, N'Canh rau ngót', N'Canh ngon mùa hè', 30, 10, NULL, N'Dễ', 10, CAST(N'2024-10-31T02:02:28.540' AS DateTime), CAST(N'2024-10-31T02:02:28.540' AS DateTime), N'https://cdn2.fptshop.com.vn/unsafe/1920x0/filters:quality(100)/2023_10_10_638325371086947278_cach-nau-canh-rau-ngot.jpg', NULL, 1)
INSERT [dbo].[Recipe] ([RecipeId], [CategoryId], [RecipeName], [Description], [CookTime], [PrepTime], [Servings], [DifficultyLevel], [UserId], [CreatedAt], [UpdatedAt], [Image], [Video], [IsPublic]) VALUES (70, 2, N'Banh', N'Banh', 20, 15, NULL, N'Trung bình', 1, CAST(N'2024-11-05T16:48:39.683' AS DateTime), CAST(N'2024-11-05T16:48:39.683' AS DateTime), N'https://canhdep.net/images/thumbs/2016/04/mon-an-ngon.jpg', NULL, 0)
INSERT [dbo].[Recipe] ([RecipeId], [CategoryId], [RecipeName], [Description], [CookTime], [PrepTime], [Servings], [DifficultyLevel], [UserId], [CreatedAt], [UpdatedAt], [Image], [Video], [IsPublic]) VALUES (71, 2, N'Banh bao', N'banh bao', 20, 20, NULL, N'Khó', 1, CAST(N'2024-11-05T16:51:05.163' AS DateTime), CAST(N'2024-11-05T16:51:05.163' AS DateTime), N'https://canhdep.net/images/thumbs/2016/04/mon-an-ngon.jpg', NULL, 0)
INSERT [dbo].[Recipe] ([RecipeId], [CategoryId], [RecipeName], [Description], [CookTime], [PrepTime], [Servings], [DifficultyLevel], [UserId], [CreatedAt], [UpdatedAt], [Image], [Video], [IsPublic]) VALUES (72, 1, N'bà', N'thịt tươi', 10, 15, NULL, N'Dễ', 14, CAST(N'2024-11-05T17:20:31.973' AS DateTime), CAST(N'2024-11-05T17:20:31.973' AS DateTime), NULL, NULL, 0)
INSERT [dbo].[Recipe] ([RecipeId], [CategoryId], [RecipeName], [Description], [CookTime], [PrepTime], [Servings], [DifficultyLevel], [UserId], [CreatedAt], [UpdatedAt], [Image], [Video], [IsPublic]) VALUES (73, 13, N'Táo dai', N'Táo dai nè', 30, 5, NULL, N'Khó', 1, CAST(N'2024-11-08T08:34:33.167' AS DateTime), CAST(N'2024-11-08T08:34:33.167' AS DateTime), N'https://res.cloudinary.com/dpnvzshsh/image/upload/v1731054866/HomNayAnGi/iql7heuuxtacc1u29sgi.jpg', NULL, 0)
INSERT [dbo].[Recipe] ([RecipeId], [CategoryId], [RecipeName], [Description], [CookTime], [PrepTime], [Servings], [DifficultyLevel], [UserId], [CreatedAt], [UpdatedAt], [Image], [Video], [IsPublic]) VALUES (74, 9, N'Táo tàu', N'Táo tàu nè', 15, 5, 5, N'Dễ', 1, CAST(N'2024-11-08T08:36:39.763' AS DateTime), CAST(N'2024-11-08T08:36:39.763' AS DateTime), N'https://res.cloudinary.com/dpnvzshsh/image/upload/v1731054997/HomNayAnGi/uk1uznd9flxcpncvta9t.jpg', NULL, 0)
INSERT [dbo].[Recipe] ([RecipeId], [CategoryId], [RecipeName], [Description], [CookTime], [PrepTime], [Servings], [DifficultyLevel], [UserId], [CreatedAt], [UpdatedAt], [Image], [Video], [IsPublic]) VALUES (78, 1, N'Hehehe', N'111111', 10, 10, 5, N'Dễ', 1, CAST(N'2024-11-08T16:11:32.643' AS DateTime), CAST(N'2024-11-08T16:11:32.643' AS DateTime), NULL, NULL, 0)
INSERT [dbo].[Recipe] ([RecipeId], [CategoryId], [RecipeName], [Description], [CookTime], [PrepTime], [Servings], [DifficultyLevel], [UserId], [CreatedAt], [UpdatedAt], [Image], [Video], [IsPublic]) VALUES (79, 1, N'Hehehe', N'111111', 10, 10, 5, N'Dễ', 1, CAST(N'2024-11-08T16:11:47.057' AS DateTime), CAST(N'2024-11-08T16:11:47.057' AS DateTime), NULL, NULL, 0)
INSERT [dbo].[Recipe] ([RecipeId], [CategoryId], [RecipeName], [Description], [CookTime], [PrepTime], [Servings], [DifficultyLevel], [UserId], [CreatedAt], [UpdatedAt], [Image], [Video], [IsPublic]) VALUES (80, 1, N'Hehehe', N'111111', 10, 10, 5, N'Dễ', 1, CAST(N'2024-11-08T16:11:58.910' AS DateTime), CAST(N'2024-11-08T16:11:58.910' AS DateTime), NULL, NULL, 0)
INSERT [dbo].[Recipe] ([RecipeId], [CategoryId], [RecipeName], [Description], [CookTime], [PrepTime], [Servings], [DifficultyLevel], [UserId], [CreatedAt], [UpdatedAt], [Image], [Video], [IsPublic]) VALUES (81, 1, N'Hehehe', N'111111', 10, 10, 5, N'Dễ', 1, CAST(N'2024-11-08T16:12:20.803' AS DateTime), CAST(N'2024-11-08T16:12:20.803' AS DateTime), NULL, NULL, 0)
INSERT [dbo].[Recipe] ([RecipeId], [CategoryId], [RecipeName], [Description], [CookTime], [PrepTime], [Servings], [DifficultyLevel], [UserId], [CreatedAt], [UpdatedAt], [Image], [Video], [IsPublic]) VALUES (82, 1, N'Hehehe', N'111111', 10, 10, 5, N'Dễ', 1, CAST(N'2024-11-08T16:12:34.197' AS DateTime), CAST(N'2024-11-08T16:12:34.197' AS DateTime), NULL, NULL, 0)
INSERT [dbo].[Recipe] ([RecipeId], [CategoryId], [RecipeName], [Description], [CookTime], [PrepTime], [Servings], [DifficultyLevel], [UserId], [CreatedAt], [UpdatedAt], [Image], [Video], [IsPublic]) VALUES (83, 1, N'Hehehe', N'111111', 10, 10, 5, N'Dễ', 1, CAST(N'2024-11-08T16:13:09.557' AS DateTime), CAST(N'2024-11-08T16:13:09.557' AS DateTime), NULL, NULL, 0)
INSERT [dbo].[Recipe] ([RecipeId], [CategoryId], [RecipeName], [Description], [CookTime], [PrepTime], [Servings], [DifficultyLevel], [UserId], [CreatedAt], [UpdatedAt], [Image], [Video], [IsPublic]) VALUES (84, 1, N'Hehehe', N'111111', 10, 10, 5, N'Dễ', 1, CAST(N'2024-11-08T16:14:45.270' AS DateTime), CAST(N'2024-11-08T16:14:45.270' AS DateTime), NULL, NULL, 0)
INSERT [dbo].[Recipe] ([RecipeId], [CategoryId], [RecipeName], [Description], [CookTime], [PrepTime], [Servings], [DifficultyLevel], [UserId], [CreatedAt], [UpdatedAt], [Image], [Video], [IsPublic]) VALUES (85, 1, N'Hehehe', N'111111', 10, 10, 5, N'Dễ', 1, CAST(N'2024-11-08T16:15:51.430' AS DateTime), CAST(N'2024-11-08T16:15:51.430' AS DateTime), NULL, NULL, 0)
INSERT [dbo].[Recipe] ([RecipeId], [CategoryId], [RecipeName], [Description], [CookTime], [PrepTime], [Servings], [DifficultyLevel], [UserId], [CreatedAt], [UpdatedAt], [Image], [Video], [IsPublic]) VALUES (86, 11, N'Bánh kem', N'Bánh<div>Kem</div>', 10, 20, 5, N'Dễ', 1, CAST(N'2024-11-08T17:27:01.640' AS DateTime), CAST(N'2024-11-08T17:27:01.640' AS DateTime), N'https://res.cloudinary.com/dpnvzshsh/image/upload/v1731086819/HomNayAnGi/rfb5tefjcdch10yqiiuv.jpg', NULL, 0)
INSERT [dbo].[Recipe] ([RecipeId], [CategoryId], [RecipeName], [Description], [CookTime], [PrepTime], [Servings], [DifficultyLevel], [UserId], [CreatedAt], [UpdatedAt], [Image], [Video], [IsPublic]) VALUES (87, 42, N'vfdsv', N'dwqed', 222, 22, 22, N'Dễ', 1, CAST(N'2024-11-08T17:37:21.413' AS DateTime), CAST(N'2024-11-08T17:37:21.413' AS DateTime), NULL, NULL, 0)
INSERT [dbo].[Recipe] ([RecipeId], [CategoryId], [RecipeName], [Description], [CookTime], [PrepTime], [Servings], [DifficultyLevel], [UserId], [CreatedAt], [UpdatedAt], [Image], [Video], [IsPublic]) VALUES (88, 10, N'Cá mòi', N'Mói', 14, 15, 5, N'Trung bình', 1, CAST(N'2024-11-09T02:02:13.163' AS DateTime), CAST(N'2024-11-09T02:02:13.163' AS DateTime), N'https://res.cloudinary.com/dpnvzshsh/image/upload/v1731117731/HomNayAnGi/t5k9asqyjrqqm5z7dpnu.png', NULL, 0)
INSERT [dbo].[Recipe] ([RecipeId], [CategoryId], [RecipeName], [Description], [CookTime], [PrepTime], [Servings], [DifficultyLevel], [UserId], [CreatedAt], [UpdatedAt], [Image], [Video], [IsPublic]) VALUES (89, 45, N'Gạo luộc', N'Gạo luộc nước', 15, 5, 4, N'Khó', 1, CAST(N'2024-11-09T02:39:42.923' AS DateTime), CAST(N'2024-11-09T02:39:42.923' AS DateTime), N'https://res.cloudinary.com/dpnvzshsh/image/upload/v1731119973/HomNayAnGi/heetljwxeirwvtfqcea8.jpg', NULL, 1)
SET IDENTITY_INSERT [dbo].[Recipe] OFF
GO
SET IDENTITY_INSERT [dbo].[RecipeCategory] ON 

INSERT [dbo].[RecipeCategory] ([CategoryId], [CategoryName], [CreatedBy]) VALUES (1, N'Ẩm thực đường phố', NULL)
INSERT [dbo].[RecipeCategory] ([CategoryId], [CategoryName], [CreatedBy]) VALUES (2, N'Bánh', NULL)
INSERT [dbo].[RecipeCategory] ([CategoryId], [CategoryName], [CreatedBy]) VALUES (3, N'Canh', NULL)
INSERT [dbo].[RecipeCategory] ([CategoryId], [CategoryName], [CreatedBy]) VALUES (4, N'Cơm', NULL)
INSERT [dbo].[RecipeCategory] ([CategoryId], [CategoryName], [CreatedBy]) VALUES (5, N'Món chiên', NULL)
INSERT [dbo].[RecipeCategory] ([CategoryId], [CategoryName], [CreatedBy]) VALUES (6, N'Mì', NULL)
INSERT [dbo].[RecipeCategory] ([CategoryId], [CategoryName], [CreatedBy]) VALUES (7, N'Miến', NULL)
INSERT [dbo].[RecipeCategory] ([CategoryId], [CategoryName], [CreatedBy]) VALUES (8, N'Món hầm', NULL)
INSERT [dbo].[RecipeCategory] ([CategoryId], [CategoryName], [CreatedBy]) VALUES (9, N'Món khai vị', NULL)
INSERT [dbo].[RecipeCategory] ([CategoryId], [CategoryName], [CreatedBy]) VALUES (10, N'Món mặn', NULL)
INSERT [dbo].[RecipeCategory] ([CategoryId], [CategoryName], [CreatedBy]) VALUES (11, N'Món ngọt', NULL)
INSERT [dbo].[RecipeCategory] ([CategoryId], [CategoryName], [CreatedBy]) VALUES (12, N'Món nướng', NULL)
INSERT [dbo].[RecipeCategory] ([CategoryId], [CategoryName], [CreatedBy]) VALUES (13, N'Món tráng miệng', NULL)
INSERT [dbo].[RecipeCategory] ([CategoryId], [CategoryName], [CreatedBy]) VALUES (14, N'Nước xốt', NULL)
INSERT [dbo].[RecipeCategory] ([CategoryId], [CategoryName], [CreatedBy]) VALUES (15, N'Salad', NULL)
INSERT [dbo].[RecipeCategory] ([CategoryId], [CategoryName], [CreatedBy]) VALUES (16, N'Thức ăn chơi', NULL)
INSERT [dbo].[RecipeCategory] ([CategoryId], [CategoryName], [CreatedBy]) VALUES (17, N'Thức ăn dịp lễ hội', NULL)
INSERT [dbo].[RecipeCategory] ([CategoryId], [CategoryName], [CreatedBy]) VALUES (18, N'Thức ăn nhanh', NULL)
INSERT [dbo].[RecipeCategory] ([CategoryId], [CategoryName], [CreatedBy]) VALUES (19, N'Thức ăn nhẹ', NULL)
INSERT [dbo].[RecipeCategory] ([CategoryId], [CategoryName], [CreatedBy]) VALUES (20, N'Thức ăn từ thuỷ sản', NULL)
INSERT [dbo].[RecipeCategory] ([CategoryId], [CategoryName], [CreatedBy]) VALUES (21, N'Đặc sản Nghệ An', 1)
INSERT [dbo].[RecipeCategory] ([CategoryId], [CategoryName], [CreatedBy]) VALUES (29, N'Đặc sản Phú Yên', 1)
INSERT [dbo].[RecipeCategory] ([CategoryId], [CategoryName], [CreatedBy]) VALUES (31, N'Đặc sản Hà Nội', 1)
INSERT [dbo].[RecipeCategory] ([CategoryId], [CategoryName], [CreatedBy]) VALUES (41, N'Systems', 1)
INSERT [dbo].[RecipeCategory] ([CategoryId], [CategoryName], [CreatedBy]) VALUES (42, N'Hiep 2', 1)
INSERT [dbo].[RecipeCategory] ([CategoryId], [CategoryName], [CreatedBy]) VALUES (44, N'111', 15)
INSERT [dbo].[RecipeCategory] ([CategoryId], [CategoryName], [CreatedBy]) VALUES (45, N'Demo', 1)
SET IDENTITY_INSERT [dbo].[RecipeCategory] OFF
GO
SET IDENTITY_INSERT [dbo].[RecipeComment] ON 

INSERT [dbo].[RecipeComment] ([CommentId], [RecipeId], [UserId], [Comment], [Rating], [CreatedAt], [ParentCommentId]) VALUES (21, 1, 1, N'hay ngon', 0, CAST(N'2024-11-05T23:52:05.770' AS DateTime), NULL)
INSERT [dbo].[RecipeComment] ([CommentId], [RecipeId], [UserId], [Comment], [Rating], [CreatedAt], [ParentCommentId]) VALUES (23, 1, 14, N'a', 0, CAST(N'2024-11-06T00:25:05.907' AS DateTime), NULL)
INSERT [dbo].[RecipeComment] ([CommentId], [RecipeId], [UserId], [Comment], [Rating], [CreatedAt], [ParentCommentId]) VALUES (24, 1, 14, N'Ngu như bò', 0, CAST(N'2024-11-07T08:09:21.923' AS DateTime), 23)
INSERT [dbo].[RecipeComment] ([CommentId], [RecipeId], [UserId], [Comment], [Rating], [CreatedAt], [ParentCommentId]) VALUES (25, 1, 13, N'đây là replies', 0, CAST(N'2024-11-07T22:55:34.033' AS DateTime), 24)
INSERT [dbo].[RecipeComment] ([CommentId], [RecipeId], [UserId], [Comment], [Rating], [CreatedAt], [ParentCommentId]) VALUES (35, 1, 17, N'fasdf', 0, CAST(N'2024-11-09T02:24:18.590' AS DateTime), 23)
INSERT [dbo].[RecipeComment] ([CommentId], [RecipeId], [UserId], [Comment], [Rating], [CreatedAt], [ParentCommentId]) VALUES (36, 1, 17, N'hay quá', 0, CAST(N'2024-11-09T02:33:21.213' AS DateTime), NULL)
INSERT [dbo].[RecipeComment] ([CommentId], [RecipeId], [UserId], [Comment], [Rating], [CreatedAt], [ParentCommentId]) VALUES (38, 1, 14, N'h', 0, CAST(N'2024-11-09T02:42:34.363' AS DateTime), 23)
INSERT [dbo].[RecipeComment] ([CommentId], [RecipeId], [UserId], [Comment], [Rating], [CreatedAt], [ParentCommentId]) VALUES (39, 1, 14, N'a', 0, CAST(N'2024-11-09T02:42:44.087' AS DateTime), 38)
INSERT [dbo].[RecipeComment] ([CommentId], [RecipeId], [UserId], [Comment], [Rating], [CreatedAt], [ParentCommentId]) VALUES (41, 1, 1, N'hehehe', 0, CAST(N'2024-11-09T08:26:59.607' AS DateTime), NULL)
INSERT [dbo].[RecipeComment] ([CommentId], [RecipeId], [UserId], [Comment], [Rating], [CreatedAt], [ParentCommentId]) VALUES (42, 1, 1, N'chao huy hoang', 0, CAST(N'2024-11-09T08:27:31.420' AS DateTime), 39)
SET IDENTITY_INSERT [dbo].[RecipeComment] OFF
GO
SET IDENTITY_INSERT [dbo].[RecipeIngredient] ON 

INSERT [dbo].[RecipeIngredient] ([RecipeIngredientId], [RecipeId], [IngredientId], [Quantity], [Unit]) VALUES (15, 47, 2, 1.5, N'muỗng')
INSERT [dbo].[RecipeIngredient] ([RecipeIngredientId], [RecipeId], [IngredientId], [Quantity], [Unit]) VALUES (16, 47, 29, 5, N'con')
INSERT [dbo].[RecipeIngredient] ([RecipeIngredientId], [RecipeId], [IngredientId], [Quantity], [Unit]) VALUES (17, 47, 19, 0.5, N'củ')
INSERT [dbo].[RecipeIngredient] ([RecipeIngredientId], [RecipeId], [IngredientId], [Quantity], [Unit]) VALUES (21, 49, 31, 1, N'vắt')
INSERT [dbo].[RecipeIngredient] ([RecipeIngredientId], [RecipeId], [IngredientId], [Quantity], [Unit]) VALUES (22, 49, 28, 2, N'cái')
INSERT [dbo].[RecipeIngredient] ([RecipeIngredientId], [RecipeId], [IngredientId], [Quantity], [Unit]) VALUES (23, 49, 18, 2, N'cái')
INSERT [dbo].[RecipeIngredient] ([RecipeIngredientId], [RecipeId], [IngredientId], [Quantity], [Unit]) VALUES (25, 57, 32, 1, N'bó nhỏ')
INSERT [dbo].[RecipeIngredient] ([RecipeIngredientId], [RecipeId], [IngredientId], [Quantity], [Unit]) VALUES (26, 57, 33, 100, N'gram')
INSERT [dbo].[RecipeIngredient] ([RecipeIngredientId], [RecipeId], [IngredientId], [Quantity], [Unit]) VALUES (27, 57, 34, 1, N'củ')
INSERT [dbo].[RecipeIngredient] ([RecipeIngredientId], [RecipeId], [IngredientId], [Quantity], [Unit]) VALUES (40, 72, 13, 1, N'thìa')
INSERT [dbo].[RecipeIngredient] ([RecipeIngredientId], [RecipeId], [IngredientId], [Quantity], [Unit]) VALUES (42, 74, 17, 2, N'miếng')
INSERT [dbo].[RecipeIngredient] ([RecipeIngredientId], [RecipeId], [IngredientId], [Quantity], [Unit]) VALUES (43, 74, 18, 5, N'quả')
INSERT [dbo].[RecipeIngredient] ([RecipeIngredientId], [RecipeId], [IngredientId], [Quantity], [Unit]) VALUES (44, 74, 13, 2, N'muỗng')
INSERT [dbo].[RecipeIngredient] ([RecipeIngredientId], [RecipeId], [IngredientId], [Quantity], [Unit]) VALUES (45, 74, 20, 2, N'muỗng')
INSERT [dbo].[RecipeIngredient] ([RecipeIngredientId], [RecipeId], [IngredientId], [Quantity], [Unit]) VALUES (46, 74, 6, 2, N'lát')
INSERT [dbo].[RecipeIngredient] ([RecipeIngredientId], [RecipeId], [IngredientId], [Quantity], [Unit]) VALUES (47, 74, 30, 2, N'bát')
INSERT [dbo].[RecipeIngredient] ([RecipeIngredientId], [RecipeId], [IngredientId], [Quantity], [Unit]) VALUES (50, 74, 3, 3, N'muỗng')
INSERT [dbo].[RecipeIngredient] ([RecipeIngredientId], [RecipeId], [IngredientId], [Quantity], [Unit]) VALUES (54, 74, 19, 2, N'củ')
INSERT [dbo].[RecipeIngredient] ([RecipeIngredientId], [RecipeId], [IngredientId], [Quantity], [Unit]) VALUES (56, 86, 56, 2, N'người')
INSERT [dbo].[RecipeIngredient] ([RecipeIngredientId], [RecipeId], [IngredientId], [Quantity], [Unit]) VALUES (57, 15, 12, 2, N'thùng')
INSERT [dbo].[RecipeIngredient] ([RecipeIngredientId], [RecipeId], [IngredientId], [Quantity], [Unit]) VALUES (58, 88, 19, 2, N'cọng')
INSERT [dbo].[RecipeIngredient] ([RecipeIngredientId], [RecipeId], [IngredientId], [Quantity], [Unit]) VALUES (59, 88, 8, 2, N'trái')
INSERT [dbo].[RecipeIngredient] ([RecipeIngredientId], [RecipeId], [IngredientId], [Quantity], [Unit]) VALUES (60, 89, 60, 2, N'bát')
INSERT [dbo].[RecipeIngredient] ([RecipeIngredientId], [RecipeId], [IngredientId], [Quantity], [Unit]) VALUES (61, 89, 3, 3, N'bát')
SET IDENTITY_INSERT [dbo].[RecipeIngredient] OFF
GO
SET IDENTITY_INSERT [dbo].[RecipeMeal] ON 

INSERT [dbo].[RecipeMeal] ([RecipeMealId], [MealId], [RecipeId]) VALUES (2, 1, 47)
INSERT [dbo].[RecipeMeal] ([RecipeMealId], [MealId], [RecipeId]) VALUES (3, 2, 47)
SET IDENTITY_INSERT [dbo].[RecipeMeal] OFF
GO
SET IDENTITY_INSERT [dbo].[RecipeStep] ON 

INSERT [dbo].[RecipeStep] ([StepId], [RecipeId], [StepNumber], [Instruction]) VALUES (1, 47, 1, N'Sơ chế lươn')
INSERT [dbo].[RecipeStep] ([StepId], [RecipeId], [StepNumber], [Instruction]) VALUES (2, 47, 2, N'Cho hết nguyên liệu vào')
INSERT [dbo].[RecipeStep] ([StepId], [RecipeId], [StepNumber], [Instruction]) VALUES (3, 47, 3, N'Let him cook')
INSERT [dbo].[RecipeStep] ([StepId], [RecipeId], [StepNumber], [Instruction]) VALUES (10, 49, 3, N'Để vào tô các nguyên liệu và trộn đều')
INSERT [dbo].[RecipeStep] ([StepId], [RecipeId], [StepNumber], [Instruction]) VALUES (15, 57, 1, N'Rửa và vò nát rau ngót')
INSERT [dbo].[RecipeStep] ([StepId], [RecipeId], [StepNumber], [Instruction]) VALUES (16, 57, 2, N'Cắt nhỏ hành khô')
INSERT [dbo].[RecipeStep] ([StepId], [RecipeId], [StepNumber], [Instruction]) VALUES (17, 57, 3, N'Cho rau ngót và thịt băm vào xào với dầu trong 2 phút')
INSERT [dbo].[RecipeStep] ([StepId], [RecipeId], [StepNumber], [Instruction]) VALUES (18, 57, 4, N'Cho 650ml nước vào')
INSERT [dbo].[RecipeStep] ([StepId], [RecipeId], [StepNumber], [Instruction]) VALUES (19, 57, 5, N'Nêm nếm đủ dùng')
INSERT [dbo].[RecipeStep] ([StepId], [RecipeId], [StepNumber], [Instruction]) VALUES (20, 57, 6, N'Nấu trong 10 phút')
INSERT [dbo].[RecipeStep] ([StepId], [RecipeId], [StepNumber], [Instruction]) VALUES (21, 57, 7, N'Ăn')
INSERT [dbo].[RecipeStep] ([StepId], [RecipeId], [StepNumber], [Instruction]) VALUES (35, 72, 1, N'bỏ bà vào nồi')
INSERT [dbo].[RecipeStep] ([StepId], [RecipeId], [StepNumber], [Instruction]) VALUES (36, 72, 2, N'bảo tài vớt bà ra ra chậu')
INSERT [dbo].[RecipeStep] ([StepId], [RecipeId], [StepNumber], [Instruction]) VALUES (41, NULL, NULL, NULL)
INSERT [dbo].[RecipeStep] ([StepId], [RecipeId], [StepNumber], [Instruction]) VALUES (42, NULL, NULL, NULL)
INSERT [dbo].[RecipeStep] ([StepId], [RecipeId], [StepNumber], [Instruction]) VALUES (43, NULL, NULL, NULL)
INSERT [dbo].[RecipeStep] ([StepId], [RecipeId], [StepNumber], [Instruction]) VALUES (48, 57, 8, N'Huhu2')
INSERT [dbo].[RecipeStep] ([StepId], [RecipeId], [StepNumber], [Instruction]) VALUES (49, 74, 1, N'Huhu')
INSERT [dbo].[RecipeStep] ([StepId], [RecipeId], [StepNumber], [Instruction]) VALUES (50, 86, 1, N'Vặt lông Tuấn Anh')
INSERT [dbo].[RecipeStep] ([StepId], [RecipeId], [StepNumber], [Instruction]) VALUES (51, 86, 2, N'Huhu')
INSERT [dbo].[RecipeStep] ([StepId], [RecipeId], [StepNumber], [Instruction]) VALUES (53, 89, 1, N'Vò gạo với nước')
SET IDENTITY_INSERT [dbo].[RecipeStep] OFF
GO
INSERT [dbo].[SignupOTP] ([SignupRequestId], [OTPString], [RequestAttemptsRemains], [ExpiresAt]) VALUES (N'2b112729-0756-4681-beba-2697f10e7e16', N'937208', 3, CAST(N'2024-11-09T00:41:10.487' AS DateTime))
INSERT [dbo].[SignupOTP] ([SignupRequestId], [OTPString], [RequestAttemptsRemains], [ExpiresAt]) VALUES (N'b5f883b1-6a98-46fb-b901-5d396bc0b789', N'829772', 3, CAST(N'2024-11-05T21:10:02.533' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[StepImage] ON 

INSERT [dbo].[StepImage] ([StepImageId], [StepId], [ImageLink]) VALUES (1, 15, N'https://cdn.eva.vn/upload/3-2014/images/2014-07-23/1406080071-sam_2270.jpg')
INSERT [dbo].[StepImage] ([StepImageId], [StepId], [ImageLink]) VALUES (2, 15, N'https://s1.media.ngoisao.vn/resize_580/news/2024/04/17/vo-rau-ngot-768x1024-ngoisaovn-w768-h1024.jpg')
INSERT [dbo].[StepImage] ([StepImageId], [StepId], [ImageLink]) VALUES (3, 16, N'https://afamilycdn.com/150157425591193600/2022/8/13/hanh1-1660399153146840690533.jpeg')
INSERT [dbo].[StepImage] ([StepImageId], [StepId], [ImageLink]) VALUES (4, 17, N'https://bepxua.vn/wp-content/uploads/2021/08/canh-rau-ngot-thi-bam-3-1024x768.jpg')
INSERT [dbo].[StepImage] ([StepImageId], [StepId], [ImageLink]) VALUES (5, 17, N'https://danviet.mediacdn.vn/zoom/700_438/296231569849192448/2023/5/15/-45-lan-rau-thuong-nau-voi-trung-rat-ngon-quet-sach-rac-trong-rau-ngot-11-1683878742-917-width780height520-1684095820893-168409-0-0-488-780-crop-168411488666372866146.jpg')
INSERT [dbo].[StepImage] ([StepImageId], [StepId], [ImageLink]) VALUES (6, 18, N'https://cdn.tgdd.vn/Files/2019/09/14/1198179/canh-rau-ngot-nau-thit-thom-ngot-giup-be-an-ngon-201909142037216485.jpg')
INSERT [dbo].[StepImage] ([StepImageId], [StepId], [ImageLink]) VALUES (7, 21, N'https://cdn.tgdd.vn/Files/2019/04/22/1162440/cach-nau-canh-cua-rau-ngot-xoa-tan-cai-nong-mua-he-202202231436267621.jpg')
INSERT [dbo].[StepImage] ([StepImageId], [StepId], [ImageLink]) VALUES (15, 48, N'https://img.freepik.com/free-photo/military-man-suffering-from-ptsd_23-2149307529.jpg')
INSERT [dbo].[StepImage] ([StepImageId], [StepId], [ImageLink]) VALUES (16, 49, N'https://res.cloudinary.com/dpnvzshsh/image/upload/v1731082050/HomNayAnGi/tmwkxyaudqx0zzjgxjlm.jpg')
INSERT [dbo].[StepImage] ([StepImageId], [StepId], [ImageLink]) VALUES (17, 50, N'')
INSERT [dbo].[StepImage] ([StepImageId], [StepId], [ImageLink]) VALUES (18, 51, N'https://res.cloudinary.com/dpnvzshsh/image/upload/v1731086920/HomNayAnGi/pkodrxfhynpkc5tqoioz.png')
INSERT [dbo].[StepImage] ([StepImageId], [StepId], [ImageLink]) VALUES (20, 53, N'https://res.cloudinary.com/dpnvzshsh/image/upload/v1731120095/HomNayAnGi/eyyn4unh4q0snbekmx7a.png')
SET IDENTITY_INSERT [dbo].[StepImage] OFF
GO
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([UserId], [Username], [Email], [Password], [CreatedAt], [Role], [IsActive]) VALUES (1, N'tranhiep', N'hieptvhe173252@fpt.edu.vn', N'8bf36f8f22946050ddc06204a3890c5de30ad7c057c1d104f9e032e25397a38a', NULL, N'USER', 1)
INSERT [dbo].[User] ([UserId], [Username], [Email], [Password], [CreatedAt], [Role], [IsActive]) VALUES (2, N'fewfwef', N'sdf@gmail.com', N'7c5fc9971b99283105a4392bb403f4caf67e2fadee8573dfcb52d5e1022ca983', CAST(N'2024-10-28T16:18:38.987' AS DateTime), N'USER', 1)
INSERT [dbo].[User] ([UserId], [Username], [Email], [Password], [CreatedAt], [Role], [IsActive]) VALUES (3, N'tranhiep2', N'hiep@maol.cpl', N'bfddf8322176ac637616d198f6327f75dd4f8d0be91ae2bd51261c686bef2510', CAST(N'2024-10-28T17:00:04.213' AS DateTime), N'USER', 1)
INSERT [dbo].[User] ([UserId], [Username], [Email], [Password], [CreatedAt], [Role], [IsActive]) VALUES (4, N'tranhiep22', N'hieptran.pa2@gmail.com', N'2769112f253df4764a72cb026d5f3a11d237e4c4435b3f385a14054d6be903fe', CAST(N'2024-10-28T17:07:43.070' AS DateTime), N'USER', 1)
INSERT [dbo].[User] ([UserId], [Username], [Email], [Password], [CreatedAt], [Role], [IsActive]) VALUES (6, N'hieptran', N'hieptvhe173252@gmail.com', N'bfddf8322176ac637616d198f6327f75dd4f8d0be91ae2bd51261c686bef2510', CAST(N'2024-10-28T17:36:38.853' AS DateTime), N'USER', 1)
INSERT [dbo].[User] ([UserId], [Username], [Email], [Password], [CreatedAt], [Role], [IsActive]) VALUES (7, N'hieptv', N'hieptv@gmail.com', N'bfddf8322176ac637616d198f6327f75dd4f8d0be91ae2bd51261c686bef2510', CAST(N'2024-10-29T10:28:18.260' AS DateTime), N'USER', 1)
INSERT [dbo].[User] ([UserId], [Username], [Email], [Password], [CreatedAt], [Role], [IsActive]) VALUES (8, N'trhiwp', N'hiwp@gmail.com', N'8bf36f8f22946050ddc06204a3890c5de30ad7c057c1d104f9e032e25397a38a', CAST(N'2024-10-29T15:16:22.910' AS DateTime), N'USER', 1)
INSERT [dbo].[User] ([UserId], [Username], [Email], [Password], [CreatedAt], [Role], [IsActive]) VALUES (9, N'trunghieu', N'kininmontal2003@gmail.com', N'd601ea2d3603a0ca6f97b1a2205f25d0a2ce83e9f5fe9df371c250a52501198f', CAST(N'2024-10-30T17:30:02.383' AS DateTime), N'USER', 1)
INSERT [dbo].[User] ([UserId], [Username], [Email], [Password], [CreatedAt], [Role], [IsActive]) VALUES (10, N'hieptvhe173252', N'hieptvhe173252@fpt.edu.vnm', N'8bf36f8f22946050ddc06204a3890c5de30ad7c057c1d104f9e032e25397a38a', CAST(N'2024-10-31T01:53:04.050' AS DateTime), N'USER', 1)
INSERT [dbo].[User] ([UserId], [Username], [Email], [Password], [CreatedAt], [Role], [IsActive]) VALUES (11, N'hieptest', N'tranhiep.1326@gmail.com', N'8bf36f8f22946050ddc06204a3890c5de30ad7c057c1d104f9e032e25397a38a', CAST(N'2024-10-31T01:59:32.043' AS DateTime), N'USER', 1)
INSERT [dbo].[User] ([UserId], [Username], [Email], [Password], [CreatedAt], [Role], [IsActive]) VALUES (12, N'hiwphiwp', N'hiep@maol.com', N'bfddf8322176ac637616d198f6327f75dd4f8d0be91ae2bd51261c686bef2510', CAST(N'2024-11-04T18:22:08.700' AS DateTime), N'USER', 1)
INSERT [dbo].[User] ([UserId], [Username], [Email], [Password], [CreatedAt], [Role], [IsActive]) VALUES (13, N'hieptv2', N'hieptv2@gmail.com', N'bfddf8322176ac637616d198f6327f75dd4f8d0be91ae2bd51261c686bef2510', CAST(N'2024-11-05T14:12:00.810' AS DateTime), N'USER', 1)
INSERT [dbo].[User] ([UserId], [Username], [Email], [Password], [CreatedAt], [Role], [IsActive]) VALUES (14, N'admin', N'admin@hnag.com', N'8bf36f8f22946050ddc06204a3890c5de30ad7c057c1d104f9e032e25397a38a', CAST(N'2024-11-05T17:11:11.520' AS DateTime), N'ADMIN', 1)
INSERT [dbo].[User] ([UserId], [Username], [Email], [Password], [CreatedAt], [Role], [IsActive]) VALUES (15, N'nmdai', NULL, N'4ba30a74b3fd128071605510d37f474201a086dc3a61b0df84b69c1b10cbb852', NULL, N'USER', 0)
INSERT [dbo].[User] ([UserId], [Username], [Email], [Password], [CreatedAt], [Role], [IsActive]) VALUES (16, N'hieptv3', N'sys.oceanbooking@gmail.com', N'bfddf8322176ac637616d198f6327f75dd4f8d0be91ae2bd51261c686bef2510', CAST(N'2024-11-07T18:16:07.000' AS DateTime), N'USER', 1)
INSERT [dbo].[User] ([UserId], [Username], [Email], [Password], [CreatedAt], [Role], [IsActive]) VALUES (17, N'trunghieu1', N'trunghieu.1326@gmail.com', N'f745c8e65aee9024417bcc534bfac05d8e75c0589e3c909af477d0e8fbed0747', CAST(N'2024-11-08T03:39:12.863' AS DateTime), N'USER', 1)
INSERT [dbo].[User] ([UserId], [Username], [Email], [Password], [CreatedAt], [Role], [IsActive]) VALUES (18, N'tuanballboo', N'tuanballboo@gmail.com', N'1cc53aa1bec593755ad1e1c5de17d5d1c4cb3eaff00f2f362b1980ab261f0b76', CAST(N'2024-11-08T17:34:08.293' AS DateTime), N'USER', 1)
SET IDENTITY_INSERT [dbo].[User] OFF
GO
SET IDENTITY_INSERT [dbo].[UserFavorite] ON 

INSERT [dbo].[UserFavorite] ([UserFavoriteId], [UserId], [RecipeId]) VALUES (8, 17, 4)
INSERT [dbo].[UserFavorite] ([UserFavoriteId], [UserId], [RecipeId]) VALUES (9, 17, 8)
INSERT [dbo].[UserFavorite] ([UserFavoriteId], [UserId], [RecipeId]) VALUES (10, 17, 20)
INSERT [dbo].[UserFavorite] ([UserFavoriteId], [UserId], [RecipeId]) VALUES (12, 17, 47)
INSERT [dbo].[UserFavorite] ([UserFavoriteId], [UserId], [RecipeId]) VALUES (13, 17, 49)
INSERT [dbo].[UserFavorite] ([UserFavoriteId], [UserId], [RecipeId]) VALUES (22, 1, 1)
SET IDENTITY_INSERT [dbo].[UserFavorite] OFF
GO
SET IDENTITY_INSERT [dbo].[UserRefreshToken] ON 

INSERT [dbo].[UserRefreshToken] ([UserRefreshTokenId], [UserId], [RefreshToken], [CreatedAt], [ExpiresAt], [DeviceID]) VALUES (177, 2, N'hqkZKaqV2dMMqTBif7q/5SDUxNLgE7ND6a3yPo1sn2g=', CAST(N'2024-11-09T03:32:08.503' AS DateTime), CAST(N'2024-12-09T03:32:08.503' AS DateTime), N'17ec0f7a-1da2-4ddb-8af3-4bf6f088d6e4')
INSERT [dbo].[UserRefreshToken] ([UserRefreshTokenId], [UserId], [RefreshToken], [CreatedAt], [ExpiresAt], [DeviceID]) VALUES (183, 14, N'jyn4co8G3SkaV05lkI3X4I1MUx9RkF1Nn8TykAKoqVg=', CAST(N'2024-11-09T08:59:26.427' AS DateTime), CAST(N'2024-12-09T08:59:26.427' AS DateTime), N'17ec0f7a-1da2-4ddb-8af3-4bf6f088d6e4')
INSERT [dbo].[UserRefreshToken] ([UserRefreshTokenId], [UserId], [RefreshToken], [CreatedAt], [ExpiresAt], [DeviceID]) VALUES (185, 1, N'lYfSFKITfGKeXhrb2SYlWt1I80+fqKZIhWTVV7Mr0JU=', CAST(N'2024-11-09T09:35:52.037' AS DateTime), CAST(N'2024-12-09T09:35:52.037' AS DateTime), N'17ec0f7a-1da2-4ddb-8af3-4bf6f088d6e4')
SET IDENTITY_INSERT [dbo].[UserRefreshToken] OFF
GO
ALTER TABLE [dbo].[Recipe] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[Recipe] ADD  DEFAULT (getdate()) FOR [UpdatedAt]
GO
ALTER TABLE [dbo].[RecipeComment] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[User] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[Ingredient]  WITH CHECK ADD  CONSTRAINT [Ingredient_User] FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[User] ([UserId])
GO
ALTER TABLE [dbo].[Ingredient] CHECK CONSTRAINT [Ingredient_User]
GO
ALTER TABLE [dbo].[NutritionFact]  WITH CHECK ADD  CONSTRAINT [FK_5] FOREIGN KEY([RecipeId])
REFERENCES [dbo].[Recipe] ([RecipeId])
GO
ALTER TABLE [dbo].[NutritionFact] CHECK CONSTRAINT [FK_5]
GO
ALTER TABLE [dbo].[Recipe]  WITH CHECK ADD  CONSTRAINT [Recipe_RecipeCategory] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[RecipeCategory] ([CategoryId])
GO
ALTER TABLE [dbo].[Recipe] CHECK CONSTRAINT [Recipe_RecipeCategory]
GO
ALTER TABLE [dbo].[Recipe]  WITH CHECK ADD  CONSTRAINT [Recipe_User_UserId_fk] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([UserId])
GO
ALTER TABLE [dbo].[Recipe] CHECK CONSTRAINT [Recipe_User_UserId_fk]
GO
ALTER TABLE [dbo].[RecipeCategory]  WITH CHECK ADD  CONSTRAINT [RecipeCategory_User] FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[User] ([UserId])
GO
ALTER TABLE [dbo].[RecipeCategory] CHECK CONSTRAINT [RecipeCategory_User]
GO
ALTER TABLE [dbo].[RecipeComment]  WITH CHECK ADD  CONSTRAINT [FK_8] FOREIGN KEY([RecipeId])
REFERENCES [dbo].[Recipe] ([RecipeId])
GO
ALTER TABLE [dbo].[RecipeComment] CHECK CONSTRAINT [FK_8]
GO
ALTER TABLE [dbo].[RecipeComment]  WITH CHECK ADD  CONSTRAINT [FK_9] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([UserId])
GO
ALTER TABLE [dbo].[RecipeComment] CHECK CONSTRAINT [FK_9]
GO
ALTER TABLE [dbo].[RecipeComment]  WITH CHECK ADD  CONSTRAINT [FK_RecipeComment_ParentComment] FOREIGN KEY([ParentCommentId])
REFERENCES [dbo].[RecipeComment] ([CommentId])
GO
ALTER TABLE [dbo].[RecipeComment] CHECK CONSTRAINT [FK_RecipeComment_ParentComment]
GO
ALTER TABLE [dbo].[RecipeIngredient]  WITH CHECK ADD  CONSTRAINT [FK_2] FOREIGN KEY([RecipeId])
REFERENCES [dbo].[Recipe] ([RecipeId])
GO
ALTER TABLE [dbo].[RecipeIngredient] CHECK CONSTRAINT [FK_2]
GO
ALTER TABLE [dbo].[RecipeIngredient]  WITH CHECK ADD  CONSTRAINT [FK_3] FOREIGN KEY([IngredientId])
REFERENCES [dbo].[Ingredient] ([IngredientId])
GO
ALTER TABLE [dbo].[RecipeIngredient] CHECK CONSTRAINT [FK_3]
GO
ALTER TABLE [dbo].[RecipeMeal]  WITH CHECK ADD  CONSTRAINT [RecipeMeal_Meal] FOREIGN KEY([MealId])
REFERENCES [dbo].[Meal] ([MealId])
GO
ALTER TABLE [dbo].[RecipeMeal] CHECK CONSTRAINT [RecipeMeal_Meal]
GO
ALTER TABLE [dbo].[RecipeMeal]  WITH CHECK ADD  CONSTRAINT [RecipeMeal_Recipe] FOREIGN KEY([RecipeId])
REFERENCES [dbo].[Recipe] ([RecipeId])
GO
ALTER TABLE [dbo].[RecipeMeal] CHECK CONSTRAINT [RecipeMeal_Recipe]
GO
ALTER TABLE [dbo].[RecipeStep]  WITH CHECK ADD  CONSTRAINT [FK_4] FOREIGN KEY([RecipeId])
REFERENCES [dbo].[Recipe] ([RecipeId])
GO
ALTER TABLE [dbo].[RecipeStep] CHECK CONSTRAINT [FK_4]
GO
ALTER TABLE [dbo].[StepImage]  WITH CHECK ADD  CONSTRAINT [StepImage_RecipeStep] FOREIGN KEY([StepId])
REFERENCES [dbo].[RecipeStep] ([StepId])
GO
ALTER TABLE [dbo].[StepImage] CHECK CONSTRAINT [StepImage_RecipeStep]
GO
ALTER TABLE [dbo].[UserFavorite]  WITH CHECK ADD  CONSTRAINT [FK_6] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([UserId])
GO
ALTER TABLE [dbo].[UserFavorite] CHECK CONSTRAINT [FK_6]
GO
ALTER TABLE [dbo].[UserFavorite]  WITH CHECK ADD  CONSTRAINT [FK_7] FOREIGN KEY([RecipeId])
REFERENCES [dbo].[Recipe] ([RecipeId])
GO
ALTER TABLE [dbo].[UserFavorite] CHECK CONSTRAINT [FK_7]
GO
ALTER TABLE [dbo].[UserRefreshToken]  WITH CHECK ADD  CONSTRAINT [UserRefreshToken_User_fk] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([UserId])
GO
ALTER TABLE [dbo].[UserRefreshToken] CHECK CONSTRAINT [UserRefreshToken_User_fk]
GO
USE [master]
GO
ALTER DATABASE [HomNayAnGi] SET  READ_WRITE 
GO
