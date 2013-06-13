From: Andreas Schwab <schwab@linux-m68k.org>
Subject: Re: [PATCH] m68k/uaccess: Fix asm constraints for userspace access
Date: Thu, 13 Jun 2013 14:25:20 +0200
Message-ID: <mvm7ghyrydr.fsf@hawking.suse.de>
References: <1371124784-13306-1-git-send-email-geert@linux-m68k.org>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <1371124784-13306-1-git-send-email-geert@linux-m68k.org> (Geert
	Uytterhoeven's message of "Thu, 13 Jun 2013 13:59:44 +0200")
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org

Geert Uytterhoeven <geert@linux-m68k.org> writes:

> Also, relax the asm constraints for 16-bit userspace accesses in
> __put_user() and __get_user(), as both "move" and "moves" do support
> such transfers between memory and address registers.

There's another occurrence in __constant_copy_from_user and
__constant_copy_to_user.

Andreas.

-- 
Andreas Schwab, schwab@linux-m68k.org
GPG Key fingerprint = 58CA 54C7 6D53 942B 1756  01D3 44D5 214B 8276 4ED5
"And now for something completely different."
