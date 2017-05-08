From: Andreas Schwab <schwab@linux-m68k.org>
Subject: Re: Linux 4.11 FTBFS on m68k
Date: Mon, 08 May 2017 19:32:18 +0200
Message-ID: <87zienuue5.fsf@linux-m68k.org>
References: <b9276262-0f50-02c3-1751-344651d7e377@physik.fu-berlin.de>
        <87y3u8ir4n.fsf@linux-m68k.org>
        <CAMuHMdWaHer3uRU-bj0tKCtFs0myb0VKHMK=KE8OjR-=iac76A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-out.m-online.net ([212.18.0.9]:48189 "EHLO
        mail-out.m-online.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755124AbdEHRcV (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Mon, 8 May 2017 13:32:21 -0400
In-Reply-To: <CAMuHMdWaHer3uRU-bj0tKCtFs0myb0VKHMK=KE8OjR-=iac76A@mail.gmail.com>
        (Geert Uytterhoeven's message of "Mon, 8 May 2017 11:13:26 +0200")
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Linux/m68k <linux-m68k@vger.kernel.org>, Debian m68k <debian-68k@lists.debian.org>

On Mai 08 2017, Geert Uytterhoeven <geert@linux-m68k.org> wrote:

> Hi Andreas,
>
> On Sun, May 7, 2017 at 6:11 PM, Andreas Schwab <schwab@linux-m68k.org> wrote:
>> See commit 849de0cd2c.
>
> And?

"Looks like we need to add __attribute__ here, don't we?" is obviously
wrong.

Andreas.

-- 
Andreas Schwab, schwab@linux-m68k.org
GPG Key fingerprint = 58CA 54C7 6D53 942B 1756  01D3 44D5 214B 8276 4ED5
"And now for something completely different."
