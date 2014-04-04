From: Greg Ungerer <gregungerer@westnet.com.au>
Subject: Re: [PATCH 1/2] Add correct PLL settings for DragonBall VZ.
Date: Fri, 04 Apr 2014 23:42:52 +1000
Message-ID: <533EB6DC.5030003@westnet.com.au>
References: <1396449792-5121-1-git-send-email-danieruru@gmail.com>	<533D570F.8080000@gmail.com>	<CAMuHMdVECm8bWBZ_ZUhrQ34dgmf3aZ2c7aMnXORtPe9ufggsfQ@mail.gmail.com> <CAO64nm6L=p-hcH9NSFxhfQF9RNaid4fPLno9zKsAy4Jn2QnHjg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <CAO64nm6L=p-hcH9NSFxhfQF9RNaid4fPLno9zKsAy4Jn2QnHjg@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Daniel Palmer <danieruru@gmail.com>, Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k <linux-m68k@lists.linux-m68k.org>

Hi Daniel,

On 04/04/14 13:18, Daniel Palmer wrote:
> Only slightly related to the patch itself;
>
> At the moment you can select to support multiple DragonBall chips in a
> single kernel but I don't think that'll actually work if the PLL
> register values are hardcoded like they are at the moment. So I think
> the kconfig needs to be changed to only allow support for one chip.
> Should I make this change and send a patch?

Sure, that sounds reasonable.


> I doubt there are many people that are attempting to run Linux on
> Palms or extremely rare development boards but it does seem like it's
> possible to detect what chip the kernel is booting on from the chip id
> register. So the kernel could pick the right PLL settings based on the
> chip it's booting on and then the same kernel image could be used for
> all DragonBall based machines.

The mutually exclusive board selection can be changed back if or when
code gets added to do this. No problem there.

Regards
Greg
