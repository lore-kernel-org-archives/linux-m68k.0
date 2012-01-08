From: Alan Hourihane <alanh@fairlite.co.uk>
Subject: Re: Atari TT (next)
Date: Sun, 08 Jan 2012 19:50:07 +0000
Message-ID: <4F09F36F.1020000@fairlite.co.uk>
References: <4F079F6B.8080502@fairlite.co.uk> <CAMuHMdUJ3+DmD861KRqCxDYaQhi_3CXNhymVxN0JFCaXf0OdMA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from fairlite.demon.co.uk ([80.176.228.186]:54865 "EHLO
	fairlite.demon.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752296Ab2AHTul (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sun, 8 Jan 2012 14:50:41 -0500
In-Reply-To: <CAMuHMdUJ3+DmD861KRqCxDYaQhi_3CXNhymVxN0JFCaXf0OdMA@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Linux/m68k <linux-m68k@vger.kernel.org>

On 08/01/12 17:45, Geert Uytterhoeven wrote:
> On Sat, Jan 7, 2012 at 02:27, Alan Hourihane <alanh@fairlite.co.uk> wrote:
>> O.k. I'm passed the unexpected interrupt problem.
> BTW, what was wrong?
>

It wasn't TT_MFP_TIMD, it was actually the first VME software interrupt.

I'll get a patch together when I've confirmed it working with atafb,
when that's working too :-)

Alan.
