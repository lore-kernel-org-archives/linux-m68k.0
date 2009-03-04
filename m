From: Krzysztof Helt <krzysztof.h1@poczta.fm>
Subject: cirrusfb: Picasso 4 card
Date: Wed, 4 Mar 2009 21:23:48 +0100
Message-ID: <20090304212348.7d1e7df3.krzysztof.h1@poczta.fm>
References: <20090224223702.86f7e129.krzysztof.h1@poczta.fm>
	<10f740e80902250048j31a9a2c5n5c39066ba156c10d@mail.gmail.com>
	<20090225093729.GA18736@chumley.debian.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <20090225093729.GA18736@chumley.debian.net>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: "Christian T. Steigies" <cts@debian.org>
Cc: Geert Uytterhoeven <geert.uytterhoeven@gmail.com>, linux-m68k@lists.linux-m68k.org

Hello Christian,

I have finished Cirrus GD5446 chip fixes for x86. 
The same chipset is used on the Picasso 4 card.

I would be grateful if you can test the cirrusfb driver 
with your Zorro  card.

Please use a driver from the -mm tree (or I can send you
the current cirrusfb.c file). Also, please add the following 
line on top of the cirrusfb.c file:

#define DEBUG 1

I am not Amiga specialist I see that these defines
are not used in the driver. 

#define  ZORRO_PROD_VILLAGE_TRONIC_PICASSO_IV_Z2_MEM1       ZORRO_ID(VILLAGE_TRONIC, 0x15, 0)
#define  ZORRO_PROD_VILLAGE_TRONIC_PICASSO_IV_Z2_MEM2       ZORRO_ID(VILLAGE_TRONIC, 0x16, 0)
#define  ZORRO_PROD_VILLAGE_TRONIC_PICASSO_IV_Z2_REG        ZORRO_ID(VILLAGE_TRONIC, 0x17, 0)

Does anybody know how to use them inside the driver?

Kind regards,
Krzysztof


----------------------------------------------------------------------
Udar sloneczny prezesa Kaczynskiego... >>> http://link.interia.pl/f2083

