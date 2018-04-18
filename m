From: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH v3 00/10] New network driver for Amiga X-Surf 100 (m68k)
Date: Wed, 18 Apr 2018 14:19:57 +0200
Message-ID: <20180418121957.GB31643@lunn.ch>
References: <1523930895-6973-1-git-send-email-schmitzmic@gmail.com>
 <1524025616-3722-1-git-send-email-schmitzmic@gmail.com>
 <CAOmrzk+zUTmSzXWU9WoXYauBx2Z4qkAh+Y4d49faA8Tu5RRQnQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <netdev-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAOmrzk+zUTmSzXWU9WoXYauBx2Z4qkAh+Y4d49faA8Tu5RRQnQ@mail.gmail.com>
Sender: netdev-owner@vger.kernel.org
To: Michael Schmitz <schmitzmic@gmail.com>
Cc: netdev <netdev@vger.kernel.org>, Finn Thain <fthain@telegraphics.com.au>, Geert Uytterhoeven <geert@linux-m68k.org>, Florian Fainelli <f.fainelli@gmail.com>, Linux/m68k <linux-m68k@vger.kernel.org>, Michael Karcher <Michael.Karcher@fu-berlin.de>
List-Id: linux-m68k@vger.kernel.org

On Wed, Apr 18, 2018 at 05:10:45PM +1200, Michael Schmitz wrote:
> All,
> 
> just noticed belatedly that the Makefile hunk of patch 9 does no
> longer apply cleanly in 4.17-rc1, sorry. My series was based on 4.16.
> I'll resend that one, OK?

Hi Michael

You should be based on DaveM net-next tree:

git://git.kernel.org/pub/scm/linux/kernel/git/davem/net-next.git

Please also have "net-next" in the patch subject. See
Documentation/networking/netdev-FAQ.txt

	Andrew
