From: Paul Bolle <pebolle@tiscali.nl>
Subject: Re: [PATCH 12/21 v2] m68k: drop unused Kconfig symbols
Date: Tue, 18 Oct 2011 14:30:43 +0200
Message-ID: <1318941043.6414.35.camel@x61.thuisdomein>
References: <1318925407.6414.22.camel@x61.thuisdomein>
	 <4E9D6C05.9040106@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <4E9D6C05.9040106@snapgear.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Greg Ungerer <gerg@snapgear.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org

On Tue, 2011-10-18 at 22:07 +1000, Greg Ungerer wrote:
> > - dropped SOM5282EM too (discovered this while doing this second
> >    version, my scripts aren't smart enough too catch it)
> 
> Hmm. I don't want to lose the SOM5282EM config option. Although it
> isn't used inside the code it does let the configurer know that this
> specific board is supported.

Isn't there another way? You're also adding a configuration option. This
means your configurer has to make a decision whether or not to enable
support for that board while this decision actually has no effect.
Apparently that support comes for free (I'm guessing once M528x support
is enabled, I haven't checked that). Wouldn't a comment do? Or adding a
line to some help text? 

In the mean time I suppose you're willing to fix this part of my patch
yourself (ie, I don't have to redo this again).


Paul Bolle
