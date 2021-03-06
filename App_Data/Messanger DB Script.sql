GO
CREATE TABLE [dbo].[Chat](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ChatMsg] [nvarchar](max) NOT NULL,
	[Sender] [nvarchar](max) NOT NULL,
	[Receiver] [nvarchar](max) NOT NULL,
	[RecevierSeen] [int] NOT NULL,
	[DateTime] [nvarchar](max) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]


GO
CREATE TABLE [dbo].[UsersData](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Username] [nvarchar](100) NOT NULL,
	[Email] [nvarchar](max) NOT NULL,
	[Password] [nvarchar](max) NOT NULL,
	[Age] [int] NOT NULL,
	[Avater] [nvarchar](max) NOT NULL,
	[Status] [int] NULL,
	[Ip_Address] [nvarchar](max) NULL,
	[CountryName] [nvarchar](max) NULL,
	[CityName] [nvarchar](max) NULL,
	[RegionName] [nvarchar](max) NULL,
	[CountryCode] [nvarchar](max) NULL,
	[ZipCode] [nvarchar](max) NULL,
	[TimeZone] [nvarchar](max) NULL,
	[Machein] [nvarchar](max) NOT NULL,
	[TimeDate] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_UsersData] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
ALTER TABLE [dbo].[Chat] ADD  DEFAULT ((0)) FOR [RecevierSeen]
GO
ALTER TABLE [dbo].[UsersData] ADD  DEFAULT ((0)) FOR [Status]

GO
CREATE procedure [dbo].[AddMsgToTable]
@msg nvarchar(MAX),
@SenderName nvarchar(50),
@ReciverName nvarchar(50)
as
begin
	Insert into msgtable (chatMsg, MsgSender, msgReceiver) values(@msg, @SenderName, @ReciverName)
end