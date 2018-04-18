From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Subject: Re: [PATCH v3 1/9] net: phy: new Asix Electronics PHY driver
Date: Wed, 18 Apr 2018 09:04:06 +0200
Message-ID: <d36f7b13-6253-0575-3617-867220230454@physik.fu-berlin.de>
References: <1523930895-6973-1-git-send-email-schmitzmic@gmail.com>
 <1524025616-3722-2-git-send-email-schmitzmic@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <1524025616-3722-2-git-send-email-schmitzmic@gmail.com>
Content-Language: en-US
Sender: netdev-owner@vger.kernel.org
To: Michael Schmitz <schmitzmic@gmail.com>, netdev@vger.kernel.org
Cc: andrew@lunn.ch, fthain@telegraphics.com.au, geert@linux-m68k.org, f.fainelli@gmail.com, linux-m68k@vger.kernel.org, Michael.Karcher@fu-berlin.de
List-Id: linux-m68k@vger.kernel.org

On 04/18/2018 06:26 AM, Michael Schmitz wrote:
> The Asix Electronics PHY found on the X-Surf 100 Amiga Zorro network
> card by Individual Computers is buggy, and needs the reset bit toggled
> as workaround to make a PHY soft reset succed.
                                         ^^^^^^
                                         typo


-- 
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer - glaubitz@debian.org
`. `'   Freie Universitaet Berlin - glaubitz@physik.fu-berlin.de
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913
