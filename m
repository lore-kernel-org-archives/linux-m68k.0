From: Richard Cochran <richardcochran@gmail.com>
Subject: Re: Evolution of Linux kernel sizes
Date: Wed, 27 Nov 2013 10:59:14 +0100
Message-ID: <20131127095914.GA4609@netboy>
References: <CAMuHMdUr2Vr9+STwcYf1PcB=PF+u3SJxU3LYnzqQ+vdbDsp71A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-embedded-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAMuHMdUr2Vr9+STwcYf1PcB=PF+u3SJxU3LYnzqQ+vdbDsp71A@mail.gmail.com>
Sender: linux-embedded-owner@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Linux/m68k <linux-m68k@vger.kernel.org>, Linux Embedded <linux-embedded@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-m68k@vger.kernel.org

On Wed, Nov 27, 2013 at 10:35:25AM +0100, Geert Uytterhoeven wrote:
> For v3.13-rc1, the top 10 is:
> 
> Disabling CONFIG_NET saves 1038404 bytes
> Disabling CONFIG_INET saves 572034 bytes

...

> I hope you find this useful!

As another poor soul stuck with tiny resources, thank you for this
work! Now, if I could only leave networking out...

Thanks,
Richard
