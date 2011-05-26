From: Greg Ungerer <gerg@snapgear.com>
Subject: Re: [uClinux-dev] Re: [PATCH v3 5/6] m68k: remove duplicate memcpy()
 implementation
Date: Thu, 26 May 2011 21:30:02 +1000
Message-ID: <4DDE39BA.2060903@snapgear.com>
References: <1303345491-27888-1-git-send-email-gerg@snapgear.com>	<1303345491-27888-2-git-send-email-gerg@snapgear.com>	<1303345491-27888-3-git-send-email-gerg@snapgear.com>	<1303345491-27888-4-git-send-email-gerg@snapgear.com>	<1303345491-27888-5-git-send-email-gerg@snapgear.com>	<1303345491-27888-6-git-send-email-gerg@snapgear.com>	<BANLkTi=3K=J_UrG5f-sRZDG2oiWcjejkKg@mail.gmail.com>	<m2sjs542hh.fsf@igel.home>	<BANLkTinjZMVF5q11dORUMUDPkuYPPO=qJQ@mail.gmail.com>	<m3wrhgwmid.fsf@linux-m68k.org> <4DDDF1F9.8050902@snapgear.com> <08eb01cc1b76$89d0dfc0$9d729f40$@com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from sncsmrelay2.nai.com ([67.97.80.206]:11814 "EHLO
	sncsmrelay2.nai.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757084Ab1EZLes (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Thu, 26 May 2011 07:34:48 -0400
In-Reply-To: <08eb01cc1b76$89d0dfc0$9d729f40$@com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Gavin Lambert <gavinl@compacsort.com>
Cc: 'uClinux development list' <uclinux-dev@uclinux.org>, 'Andreas Schwab' <schwab@linux-m68k.org>, linux-m68k@vger.kernel.org, 'Greg Ungerer' <gerg@uclinux.org>

Hi Gavin,

On 26/05/11 17:28, Gavin Lambert wrote:
> Quoth Greg Ungerer:
>> On 24/05/11 18:06, Andreas Schwab wrote:
>>> Geert Uytterhoeven<geert@linux-m68k.org>   writes:
>>>
>>>> What exactly do you mean by "does not support anything less"? It
>>>> seems it does restrict instruction generation to 68000 if you
>>>> ask for it.
>>>
>>> The point is that Linux/m68k requires 68020+, so compiling for 68000
>>> does not make sense (at least back when the gcc configuration was
>>> created).
>>
>> Yeah, used to be true :-)
>> This seems very much to me to be a "broken compiler" issue.
>
> Hmm, that has me worried a little.  I was thinking about trying to use gcc
> for a (non-Linux) M68000 device.
>
> Does the above mean that this would be problematic?

It seems to have been fixed in newer versions of gcc.
My current 4.5.1 generates only the defines I would expect
based on the supplied machine type options.

Regards
Greg
