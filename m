From: Arnaud Lacombe <lacombar@gmail.com>
Subject: Re: [PATCH 01/11] arch/m68k: do not use EXTRA_{A,C,LD}FLAGS
Date: Mon, 15 Aug 2011 10:45:08 -0400
Message-ID: <CACqU3MXUp2hWaGNDmnBm2dO=27p4FBFNjRV8heA7p04Yf-nkwQ__5860.1722507321$1313419826$gmane$org@mail.gmail.com>
References: <1313384834-24433-1-git-send-email-lacombar@gmail.com>
	<1313384834-24433-2-git-send-email-lacombar@gmail.com>
	<alpine.OSX.2.00.1108151724491.211@ibook.local>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <alpine.OSX.2.00.1108151724491.211@ibook.local>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Finn Thain <fthain@telegraphics.com.au>
Cc: linux-kernel@vger.kernel.org, Sam Ravnborg <sam@ravnborg.org>, linux-m68k@lists.linux-m68k.org

Hi,

On Mon, Aug 15, 2011 at 3:26 AM, Finn Thain <fthain@telegraphics.com.au> wrote:
>
> On Mon, 15 Aug 2011, Arnaud Lacombe wrote:
>
>> -# EXTRA_CFLAGS += -DTRAP_DBG_INTERRUPT
>> -# EXTRA_AFLAGS += -DTRAP_DBG_INTERRUPT
>> +# ccflags-y += -DTRAP_DBG_INTERRUPT
>> +# ccflags-y += -DTRAP_DBG_INTERRUPT
>
> asflags-y?
>
yes, indeed. I'll resend later on.

 - Arnaud

> Finn
>
