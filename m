From: Finn Thain <fthain@telegraphics.com.au>
Subject: Re: [PATCH 01/11] arch/m68k: do not use EXTRA_{A,C,LD}FLAGS
Date: Mon, 15 Aug 2011 17:26:15 +1000 (EST)
Message-ID: <alpine.OSX.2.00.1108151724491.211@ibook.local>
References: <1313384834-24433-1-git-send-email-lacombar@gmail.com> <1313384834-24433-2-git-send-email-lacombar@gmail.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <1313384834-24433-2-git-send-email-lacombar@gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Arnaud Lacombe <lacombar@gmail.com>
Cc: linux-kernel@vger.kernel.org, Sam Ravnborg <sam@ravnborg.org>, linux-m68k@lists.linux-m68k.org


On Mon, 15 Aug 2011, Arnaud Lacombe wrote:

> -# EXTRA_CFLAGS += -DTRAP_DBG_INTERRUPT
> -# EXTRA_AFLAGS += -DTRAP_DBG_INTERRUPT
> +# ccflags-y += -DTRAP_DBG_INTERRUPT
> +# ccflags-y += -DTRAP_DBG_INTERRUPT

asflags-y?

Finn
