From: Laurent Vivier <lvivier@redhat.com>
Subject: Re: [PATCH v2 08/12] macintosh/via-pmu68k: Don't load driver on
 unsupported hardware
Date: Tue, 12 Jun 2018 08:53:01 +0200
Message-ID: <6c1205cb-7d65-8b30-c4df-59a0ed041313@redhat.com>
References: <cover.1528423341.git.fthain@telegraphics.com.au>
 <d9d626ca4e7ac9c7e81b24a34f5fbcae9d1d5046.1528423341.git.fthain@telegraphics.com.au>
 <9f015684-4d91-70e4-d2a4-89fe167ff8ab@gmail.com>
 <m2h8mc4ejw.fsf@linux-m68k.org>
 <e1006b0a-a429-4744-7525-203cb91f1d5f@gmail.com>
 <alpine.LNX.2.21.1806092140410.26@nippy.intranet>
 <3490f7d6f45ec2586858e4547e97474d93bd2d4d.camel@kernel.crashing.org>
 <alpine.LNX.2.21.1806120911370.34@nippy.intranet>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <alpine.LNX.2.21.1806120911370.34@nippy.intranet>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Finn Thain <fthain@telegraphics.com.au>, Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: Michael Schmitz <schmitzmic@gmail.com>, Andreas Schwab <schwab@linux-m68k.org>, linuxppc-dev@lists.ozlabs.org, linux-m68k@vger.kernel.org, linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>
List-Id: linux-m68k@vger.kernel.org

On 12/06/2018 01:47, Finn Thain wrote:
> On Sun, 10 Jun 2018, Benjamin Herrenschmidt wrote:
...
> I don't know what the bootloader situation is, but it looks messy...
> http://nubus-pmac.sourceforge.net/#booters
> 
> Laurent, does Emile work on these machines?
> 

No, Emile doesn't work on pmac-nubus, I tried to implement the switch
from m68k to ppc, but it has never worked.

Laurent
