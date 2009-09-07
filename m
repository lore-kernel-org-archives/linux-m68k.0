From: sfking@fdwdc.com
Subject: [RFC 30/31] proof of concept merge of m68k and m68knommu
Date: Sun,  6 Sep 2009 23:02:33 -0700
Message-ID: <7ac89f7d263196faeda7b73cc153813429446403.1252222135.git.sfking@fdwdc.com>
References: <0b049a980e0bb00153e690539c9ce623e985e583.1252222135.git.sfking@fdwdc.com>
 <465903f0a328dc0355b41585754da335575049a5.1252222135.git.sfking@fdwdc.com>
 <62b2356a9fcc7aabd73a6ac6b65ee4608a691a31.1252222135.git.sfking@fdwdc.com>
 <c360e0598cdd126066774c95671056a747ce1d60.1252222135.git.sfking@fdwdc.com>
 <bd5238a285f4a71b33b7571217214a4fc0aac702.1252222135.git.sfking@fdwdc.com>
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from smtp100.biz.mail.mud.yahoo.com ([68.142.201.176]:48508 "HELO
	smtp100.biz.mail.mud.yahoo.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with SMTP id S1758942AbZIGGC5 (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Mon, 7 Sep 2009 02:02:57 -0400
In-Reply-To: <bd5238a285f4a71b33b7571217214a4fc0aac702.1252222135.git.sfking@fdwdc.com>
In-Reply-To: <cover.1252222129.git.sfking@fdwdc.com>
References: <cover.1252222129.git.sfking@fdwdc.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: uclinux-dev@uclinux.org
Cc: gerg@snapgear.com, linux-m68k@lists.linux-m68k.org

---
 arch/{m68knommu => m68k}/lib/delay.c   |    0 
 arch/{m68knommu => m68k}/lib/divsi3.S  |    0 
 arch/{m68knommu => m68k}/lib/memcpy.c  |    0 
 arch/{m68knommu => m68k}/lib/memset.c  |    0 
 arch/{m68knommu => m68k}/lib/modsi3.S  |    0 
 arch/{m68knommu => m68k}/lib/mulsi3.S  |    0 
 arch/{m68knommu => m68k}/lib/udivsi3.S |    0 
 arch/{m68knommu => m68k}/lib/umodsi3.S |    0 
 8 files changed, 0 insertions(+), 0 deletions(-)
 copy arch/{m68knommu => m68k}/lib/delay.c (100%)
 copy arch/{m68knommu => m68k}/lib/divsi3.S (100%)
 copy arch/{m68knommu => m68k}/lib/memcpy.c (100%)
 copy arch/{m68knommu => m68k}/lib/memset.c (100%)
 copy arch/{m68knommu => m68k}/lib/modsi3.S (100%)
 copy arch/{m68knommu => m68k}/lib/mulsi3.S (100%)
 copy arch/{m68knommu => m68k}/lib/udivsi3.S (100%)
 copy arch/{m68knommu => m68k}/lib/umodsi3.S (100%)

diff --git a/arch/m68knommu/lib/delay.c b/arch/m68k/lib/delay.c
similarity index 100%
copy from arch/m68knommu/lib/delay.c
copy to arch/m68k/lib/delay.c
diff --git a/arch/m68knommu/lib/divsi3.S b/arch/m68k/lib/divsi3.S
similarity index 100%
copy from arch/m68knommu/lib/divsi3.S
copy to arch/m68k/lib/divsi3.S
diff --git a/arch/m68knommu/lib/memcpy.c b/arch/m68k/lib/memcpy.c
similarity index 100%
copy from arch/m68knommu/lib/memcpy.c
copy to arch/m68k/lib/memcpy.c
diff --git a/arch/m68knommu/lib/memset.c b/arch/m68k/lib/memset.c
similarity index 100%
copy from arch/m68knommu/lib/memset.c
copy to arch/m68k/lib/memset.c
diff --git a/arch/m68knommu/lib/modsi3.S b/arch/m68k/lib/modsi3.S
similarity index 100%
copy from arch/m68knommu/lib/modsi3.S
copy to arch/m68k/lib/modsi3.S
diff --git a/arch/m68knommu/lib/mulsi3.S b/arch/m68k/lib/mulsi3.S
similarity index 100%
copy from arch/m68knommu/lib/mulsi3.S
copy to arch/m68k/lib/mulsi3.S
diff --git a/arch/m68knommu/lib/udivsi3.S b/arch/m68k/lib/udivsi3.S
similarity index 100%
copy from arch/m68knommu/lib/udivsi3.S
copy to arch/m68k/lib/udivsi3.S
diff --git a/arch/m68knommu/lib/umodsi3.S b/arch/m68k/lib/umodsi3.S
similarity index 100%
copy from arch/m68knommu/lib/umodsi3.S
copy to arch/m68k/lib/umodsi3.S
-- 
1.5.6.5

