From: Daniel Palmer <danieruru@gmail.com>
Subject: Re: [PATCH 1/2] Add correct PLL settings for DragonBall VZ.
Date: Fri, 4 Apr 2014 12:18:05 +0900
Message-ID: <CAO64nm6L=p-hcH9NSFxhfQF9RNaid4fPLno9zKsAy4Jn2QnHjg@mail.gmail.com>
References: <1396449792-5121-1-git-send-email-danieruru@gmail.com>
	<533D570F.8080000@gmail.com>
	<CAMuHMdVECm8bWBZ_ZUhrQ34dgmf3aZ2c7aMnXORtPe9ufggsfQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <CAMuHMdVECm8bWBZ_ZUhrQ34dgmf3aZ2c7aMnXORtPe9ufggsfQ@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Greg Ungerer <gregungerer00@gmail.com>, linux-m68k <linux-m68k@lists.linux-m68k.org>

Only slightly related to the patch itself;

At the moment you can select to support multiple DragonBall chips in a
single kernel but I don't think that'll actually work if the PLL
register values are hardcoded like they are at the moment. So I think
the kconfig needs to be changed to only allow support for one chip.
Should I make this change and send a patch?

I doubt there are many people that are attempting to run Linux on
Palms or extremely rare development boards but it does seem like it's
possible to detect what chip the kernel is booting on from the chip id
register. So the kernel could pick the right PLL settings based on the
chip it's booting on and then the same kernel image could be used for
all DragonBall based machines.
