;(function() {
	
	$k = {
		page: {},
		proto: {},
		util: {},
		constant: {
			column: [{	value: 1,	name: "组织机构"	}, 
		            {	value: 2,	name: "图片新闻"		}, 
		            {	value: 3,	name: "南城廉政"	}, 
		            {	value: 4,	name: "信息公开"	}, 
		            {	value: 5,	name: "曝光台"	}, 
		            {	value: 6,	name: "廉政教育"	}, 
		            {	value: 7,	name: "工作动态"	}, 
		            {	value: 8,	name: "专题集锦"			}],
			political: [{	value: 0,	name: "中国共产党党员"	}, 
			            {	value: 1,	name: "中共预备党员"	}, 
			            {	value: 2,	name: "共青团员"		}, 
			            {	value: 3,	name: "民主党派人士"	}, 
			            {	value: 4,	name: "无党派民主人士"	}, 
			            {	value: 5,	name: "群众"			}],
			level: [{	value: 0,	name: "正省部级"	},
			        {	value: 1,	name: "副省部级"	},
					{	value: 2,	name: "正厅局级"	},
					{	value: 3,	name: "中管正厅局级"},
					{	value: 4,	name: "副厅局级"	},
					{	value: 5,	name: "正县处级"	},
					{	value: 6,	name: "副县处级"	},
					{	value: 7,	name: "正乡科级"	},
					{	value: 8,	name: "副乡科级"	},
					{	value: 9,	name: "一般干部"	},
					{	value: 10,	name: "军队"		},
					{	value: 11,	name: "金融机构"	},
					{	value: 12,	name: "一般企业"	},
					{	value: 13,	name: "事业"		},
					{	value: 14,	name: "农村"		},
					{	value: 15,	name: "其他"		}],
			issue: [{
				value: 0,
				name: "违反政治纪律行为",
				sub: [{	value: 0,	name: "公开发表危害党的言论"		},
				      { value: 1,	name: "参加反对党和政府的活动或组织"	},
				      {	value: 2,	name: "在党内搞团团伙伙"			},
				      {	value: 3,	name: "妨碍党和国家方针政策实施"	},
				      {	value: 4,	name: "对抗组织审查"			},
				      {	value: 5,	name: "组织参加迷信活动"			},
				      {	value: 6,	name: "叛逃及涉外活动中损害党和国家利益"},
				      {	value: 7,	name: "无原则一团和气和违反政治规矩"	},]
				}, { 
					value : 1,
					name: "违反组织纪律行为",
					sub: [{ value: 0, 	name: "违反民主集中制原则"		},
					      { value: 1,	name: "不按要求请示报告有关事项"	},
					      { value: 2,	name: "违规组织参加老乡会校友会战友会"},
					      { value: 3, 	name: "侵犯党员权利"			},
					      { value: 4, 	name: "在投票和选举中搞非组织活动"	},
					      { value: 5, 	name: "违反干部选拔任用规定"		},
					      { value: 6, 	name: "在人事劳动工作中违规谋利"	},
					      { value: 7, 	name: "违规发展党员"			},
					      { value: 8, 	name: "违规办理出国证件和在境外脱离组织"},]
				}, {
					value: 2,
					name: "违反廉洁纪律行为",
					sub: [{ value: 0, 	name: "权权交易和纵容特定关系人以权谋私"},
					      { value: 1, 	name: "违规接受礼品礼金宴请服务"	},
					      { value: 2, 	name: "违规操办婚丧喜庆事宜"		},
					      { value: 3, 	name: "违规从事营利活动"			},
					      { value: 4, 	name: "违反工作生活待遇规定"		},
					      { value: 5, 	name: "违规占有使用公私财物"		},
					      { value: 6, 	name: "违规参与公款宴请消费"		},
					      { value: 7, 	name: "违规自定薪酬和发放津贴补贴奖金"},
					      { value: 8, 	name: "公款旅游"				},
					      { value: 9, 	name: "违反公务接待管理规定"		},
					      { value: 10, 	name: "违反公务用车管理规定"		},
					      { value: 11, 	name: "违反会议活动管理规定"		},
					      { value: 12, 	name: "违反办公用房管理规定"		},
					      { value: 13, 	name: "权色钱色交易"			},
					      { value: 14, 	name: "其他违反廉洁纪律行为"		},]
				}, {
					value: 3,
					name: "违反群众纪律行为",
					sub: [{ value: 0,	name: "侵害群众利益"	},
					      { value: 1,	name: "漠视群众利益"	},
					      { value: 2,	name: "侵犯群众知情权"	},
					      { value: 3,	name: "其他违反群众纪律行为"},]
				}, {
					value: 4,
					name: "违反工作纪律行为",
					sub: [{ value: 0,	name: "主体责任落实不力"		},
					      { value: 1,	name: "违规干预市场经济活动"	},
					      { value: 2,	name: "违规干预执纪执法司法活动"},
					      { value: 3,	name: "泄露扩散窃取私存党的秘密"},
					      { value: 4,	name: "违反考试录取工作规定"	},
					      { value: 5,	name: "其他违反工作纪律行为"	},]
				}, {
					value: 5,
					name: "违反生活纪律行为",
					sub: [{ value: 0,	name: "生活奢靡"			},
					      { value: 1,	name: "不正当性关系"		},
					      { value: 2,	name: "其他违反生活纪律行为"	},]
				}, {
					value: 6,
					name: "涉法行为",
					sub: [{ value: 0,	name: "贪污贿赂行为"			},
					      { value: 1,	name: "失职渎职行为"			},
					      { value: 2,	name: "破坏社会主义市场经济秩序行为"	},
					      { value: 3,	name: "侵犯人身权利民主权利行为"	},
					      { value: 4,	name: "妨害社会管理秩序行为"		},
					      { value: 5,	name: "其他涉法行为"			},]
				}, {
					value: 7,
					name: "违反专项整治行为",
					sub: [{ value: 0,	name: "违规插手干预工程项目"	},
					      { value: 1,	name: '"红包"问题专项治理'	},
					      { value: 2,	name: '“小金库”专项整治'		},]
				}]
		},
		user: {},
		config: {},
		system: {}
	};

})();
