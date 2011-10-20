From: Paul Bolle <pebolle@tiscali.nl>
Subject: Re: [PATCH 12/21 v2] m68k: drop unused Kconfig symbols
Date: Thu, 20 Oct 2011 13:06:43 +0200
Message-ID: <1319108803.8405.28.camel@x61.thuisdomein>
References: <1318925407.6414.22.camel@x61.thuisdomein>
	 <4E9D6C05.9040106@snapgear.com> <1318941043.6414.35.camel@x61.thuisdomein>
	 <4E9FB0D6.9080301@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <4E9FB0D6.9080301@snapgear.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Greg Ungerer <gerg@snapgear.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org

On Thu, 2011-10-20 at 15:25 +1000, Greg Ungerer wrote:
> Yes, that is the idea. The configurer doesn't need to know it has
> no effect (at least currently anyway). But they know that the board
> is supported.

I'm not too fond of control knobs connected to nothing (which this
Kconfig entry now is). Maybe I'll propose an alternative, one day.

> Yes, thats fine, I will fix it and apply.

Thanks.


Paul Bolle
