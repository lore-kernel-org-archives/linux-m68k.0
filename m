From: Greg Ungerer <gerg@uclinux.org>
Subject: Re: m68k: five unused boards in Kconfig.machine
Date: Mon, 25 Mar 2013 16:43:50 +1000
Message-ID: <514FF226.3050507@uclinux.org>
References: <1363868258.1390.129.camel@x61.thuisdomein>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <1363868258.1390.129.camel@x61.thuisdomein>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Paul Bolle <pebolle@tiscali.nl>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, linux-m68k@lists.linux-m68k.org

Hi Paul,

On 21/03/13 22:17, Paul Bolle wrote:
> 0) These five Kconfig entries in arch/m68k/Kconfig.machine are entirely
> unused:
>      config UC5272
>      config UC5282
>      config SOM5282EM
>      config COBRA5329
>      config SNAPGEAR
>
> 1) I think that these can be removed. But I recall from an earlier
> thread (in 2011) that Greg wanted to keep SOM5282EM:
>      Although it isn't used inside the code it does let the configurer
>      know that this specific board is supported.
>
> 2) Would it be acceptable to remove these five Kconfig entries but add
> text to the prompts or the help strings of some other entries to
> indicate support?

I have been moving the underlying code to be more generic in
its support of various ColdFire boards. I am a lot more comfortable
now removing the specific board names if we really don't have
anything specific keyed on them.

Regards
Greg
