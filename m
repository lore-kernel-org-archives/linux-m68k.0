From: Michael Opdenacker <michael.opdenacker@free-electrons.com>
Subject: Re: [PATCH] m68k: remove unused Kconfig parameters
Date: Tue, 17 Sep 2013 05:06:14 +0200
Message-ID: <5237C726.9070002__47121.2339158685$1379387209$gmane$org@free-electrons.com>
References: <1378468779-3289-1-git-send-email-michael.opdenacker@free-electrons.com> <523798BD.9010108@westnet.com.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <523798BD.9010108@westnet.com.au>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Greg Ungerer <gregungerer@westnet.com.au>
Cc: geert@linux-m68k.org, linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org

Hi Greg,

On 09/17/2013 01:48 AM, Greg Ungerer wrote:
> Hi Michael,
>
> On 06/09/13 21:59, Michael Opdenacker wrote:
>> This patch proposes to remove the UC5282 and UC5272 kernel configuration
>> parameters defined in arch/m68k/Kconfig.machine,
>> but used nowhere in the makefiles and source code.
>>
>> Signed-off-by: Michael Opdenacker <michael.opdenacker@free-electrons.com>
> This change is a subset of c065edde ("remove 16 unused boards in
> Kconfig.machine") by Pauk Bolle. And that is in 3.12-rc1.
Awesome! Thank you very much for the good news, and for not applying the
same change twice. Pfooh, this would have created anti-kconfig
parameters. Scary. ;)

Cheers,

Michael.

-- 
Michael Opdenacker, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
+33 484 258 098
