From: Andreas Schwab <schwab@linux-m68k.org>
Subject: Re: [PATCH v2 2/2] m68k: Cleanup linker scripts using new linker  script macros.
Date: Sun, 27 Sep 2009 15:01:51 +0200
Message-ID: <m2ocowwngg.fsf@igel.home>
References: <1253119466-19488-1-git-send-email-tabbott@ksplice.com>
	<1253119466-19488-3-git-send-email-tabbott@ksplice.com>
	<10f740e80909270258o6bde0f3dk720bd5b5c091ed2f@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-out.m-online.net ([212.18.0.10]:39347 "EHLO
	mail-out.m-online.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751420AbZI0NBu (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sun, 27 Sep 2009 09:01:50 -0400
In-Reply-To: <10f740e80909270258o6bde0f3dk720bd5b5c091ed2f@mail.gmail.com>
	(Geert Uytterhoeven's message of "Sun, 27 Sep 2009 11:58:06 +0200")
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Tim Abbott <tabbott@ksplice.com>, Roman Zippel <zippel@linux-m68k.org>, linux-m68k@vger.kernel.org, linux-kernel@vger.kernel.org, Sam Ravnborg <sam@ravnborg.org>

Geert Uytterhoeven <geert@linux-m68k.org> writes:

> On Wed, Sep 16, 2009 at 18:44, Tim Abbott <tabbott@ksplice.com> wrote:
>> Signed-off-by: Tim Abbott <tabbott@ksplice.com>
>> Cc: Geert Uytterhoeven <geert@linux-m68k.org>
>> Cc: Roman Zippel <zippel@linux-m68k.org>
>> Cc: linux-m68k@lists.linux-m68k.org
>> Cc: Sam Ravnborg <sam@ravnborg.org>
>
> This patch must do something wrong, as it now fails to boot on ARAnyM:
>
> | CPU: Double bus fault detected !
> | CPU: Halting
>
> Haven't investigated why yet, though...

The problem is that _end no longer matches the end of the load segment.
Previously, the .data.init_task section was the last allocated item in
the linker script, now the last item is an align.  This align does not
affect the memsize of the segment.  The startup code expects the boot
info to be placed at _end, but the boot loader puts it at the end of the
load segment, which is the best it can do.

Andreas.

-- 
Andreas Schwab, schwab@linux-m68k.org
GPG Key fingerprint = 58CA 54C7 6D53 942B 1756  01D3 44D5 214B 8276 4ED5
"And now for something completely different."
