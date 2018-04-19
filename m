From: Florian Fainelli <f.fainelli@gmail.com>
Subject: Re: [PATCH v4 1/9] net-next: phy: new Asix Electronics PHY driver
Date: Thu, 19 Apr 2018 09:15:01 -0700
Message-ID: <fd83b159-7f81-5ad7-7f9e-81ca8b17ce4f@gmail.com>
References: <1524025616-3722-1-git-send-email-schmitzmic@gmail.com>
 <1524103526-12240-2-git-send-email-schmitzmic@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <1524103526-12240-2-git-send-email-schmitzmic@gmail.com>
Content-Language: en-US
Sender: netdev-owner@vger.kernel.org
To: Michael Schmitz <schmitzmic@gmail.com>, netdev@vger.kernel.org
Cc: andrew@lunn.ch, fthain@telegraphics.com.au, geert@linux-m68k.org, linux-m68k@vger.kernel.org, Michael.Karcher@fu-berlin.de
List-Id: linux-m68k@vger.kernel.org



On 04/18/2018 07:05 PM, Michael Schmitz wrote:
> The Asix Electronics PHY found on the X-Surf 100 Amiga Zorro network
> card by Individual Computers is buggy, and needs the reset bit toggled
> as workaround to make a PHY soft reset succeed.
> 
> Add workaround driver just for this special case.
> 
> Suggested in xsurf100 patch series review by Andrew Lunn <andrew@lunn.ch>
> 
> Signed-off-by: Michael Schmitz <schmitzmic@gmail.com>

Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>
-- 
Florian
