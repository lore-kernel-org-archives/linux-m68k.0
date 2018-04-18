From: Michael Schmitz <schmitzmic@gmail.com>
Subject: Re: [PATCH v3 00/10] New network driver for Amiga X-Surf 100 (m68k)
Date: Thu, 19 Apr 2018 09:34:29 +1200
Message-ID: <CAOmrzk+Px9dPCM3woNB6+DLsJ3bx5aagqzMs49dmSswhHpu5Gg@mail.gmail.com>
References: <1523930895-6973-1-git-send-email-schmitzmic@gmail.com>
 <1524025616-3722-1-git-send-email-schmitzmic@gmail.com> <CAOmrzk+zUTmSzXWU9WoXYauBx2Z4qkAh+Y4d49faA8Tu5RRQnQ@mail.gmail.com>
 <20180418121957.GB31643@lunn.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <20180418121957.GB31643@lunn.ch>
Sender: netdev-owner@vger.kernel.org
To: Andrew Lunn <andrew@lunn.ch>
Cc: netdev <netdev@vger.kernel.org>, Finn Thain <fthain@telegraphics.com.au>, Geert Uytterhoeven <geert@linux-m68k.org>, Florian Fainelli <f.fainelli@gmail.com>, Linux/m68k <linux-m68k@vger.kernel.org>, Michael Karcher <Michael.Karcher@fu-berlin.de>
List-Id: linux-m68k@vger.kernel.org

Hi Andrew,

sorry, my mistake. I didn't realize how fast DaveM's tree diverges
from Linus' (and Geert's) once the merge window opens.

Cheers,

  Michael


On Thu, Apr 19, 2018 at 12:19 AM, Andrew Lunn <andrew@lunn.ch> wrote:
> On Wed, Apr 18, 2018 at 05:10:45PM +1200, Michael Schmitz wrote:
>> All,
>>
>> just noticed belatedly that the Makefile hunk of patch 9 does no
>> longer apply cleanly in 4.17-rc1, sorry. My series was based on 4.16.
>> I'll resend that one, OK?
>
> Hi Michael
>
> You should be based on DaveM net-next tree:
>
> git://git.kernel.org/pub/scm/linux/kernel/git/davem/net-next.git
>
> Please also have "net-next" in the patch subject. See
> Documentation/networking/netdev-FAQ.txt
>
>         Andrew
