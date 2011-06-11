From: Jonathan Elchison <JElchison@Gmail.com>
Subject: Re: [PATCH] m68k: Patch for broken lsl64() "old code" with incorrect shift
Date: Sat, 11 Jun 2011 08:34:18 -0400
Message-ID: <BANLkTikk2v8m1wNYoTW6anRhJgy8AS9DfA@mail.gmail.com>
References: <BANLkTimUSvQi9CPgO+cCUrEdQq-+ohbzFg@mail.gmail.com> <BANLkTimz90oWNDYYNnpX5aDhJ192LhDkXA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <BANLkTimz90oWNDYYNnpX5aDhJ192LhDkXA@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@lists.linux-m68k.org, Jiri Kosina <trivial@kernel.org>, linux-kernel@vger.kernel.org, David Huggins-Daines <dhd@debian.org>

On Sat, Jun 11, 2011 at 8:01 AM, Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
> I think it's better to just remove all #ifdefed out parts in the code.

I'm good either way, as long as the broken "old code" is no longer present.

> The patch is reversed?

My apologies, you're correct.  In case anyone is interested in the
correct patch:

Signed-off-by: Jonathan Elchison <jelchison@gmail.com>

-----------------------------------------------------------------
diff -up linux-2.6_orig/arch/m68k/math-emu/multi_arith.h
linux-2.6/arch/m68k/math-emu/multi_arith.h
--- linux-2.6_orig/arch/m68k/math-emu/multi_arith.h	2011-06-10
22:47:43.407285452 -0400
+++ linux-2.6/arch/m68k/math-emu/multi_arith.h	2011-06-10
22:50:32.538711320 -0400
@@ -236,7 +236,7 @@ static inline void lsl64(int count, unsi
 {
 	if (count < 32) {
 		HI_WORD(*dest) = (HI_WORD(*dest) << count)
-		    | (LO_WORD(*dest) >> count);
+		    | (LO_WORD(*dest) >> (32 - count));
 		LO_WORD(*dest) <<= count;
 		return;
 	}
-----------------------------------------------------------------

Please personally CC me on responses to this post.

v/r,

--
Jonathan Elchison
jelchison@gmail.com
