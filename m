From: Edward Shao <laface.tw@gmail.com>
Subject: Re: Quest about m68knommu check in top of kernel Makefile.
Date: Fri, 27 Apr 2012 14:51:13 +0800
Message-ID: <CAKjXMyDBA4hLJ98BqfOfwx5bgkXQzu9V9NYfjBuP0h9eHrACeQ@mail.gmail.com>
References: <CAKjXMyAvBMgPEsdiO=F1oLHt-_DBxdoz9+G=AOsejn5SLfDS_g@mail.gmail.com>
	<4F9A3D1C.4030305@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <4F9A3D1C.4030305@snapgear.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Greg Ungerer <gerg@snapgear.com>
Cc: linux-m68k@lists.linux-m68k.org

Hi Greg,

Thank you for your suggestion. :)
I remove the whole m68knommu conditional in submitted patch.

[REF]
http://permalink.gmane.org/gmane.linux.kbuild.devel/8138

Best Regards,
Edward

On Fri, Apr 27, 2012 at 2:30 PM, Greg Ungerer <gerg@snapgear.com> wrote=
:
> Hi Edward,
>
>
> On 26/04/12 22:34, Edward Shao wrote:
>>
>> I have a question about ($(ARCH),m68knommu) check in top of kernel
>> Makefile.
>> Any reason not to change SRCARCH but change hdr-arch?
>>
>> If I modify the makefile as below, is it ok?
>>
>> diff --git a/Makefile b/Makefile
>> index afc868e..396ed28 100644
>> --- a/Makefile
>> +++ b/Makefile
>> @@ -228,13 +228,14 @@ ifeq ($(ARCH),tilegx)
>> =A0 =A0 =A0 =A0SRCARCH :=3D tile
>> =A0endif
>>
>> -# Where to locate arch specific headers
>> -hdr-arch =A0 =A0 =A0 :=3D $(SRCARCH)
>> -
>> +# Additional ARCH settings for m86k
>> =A0ifeq ($(ARCH),m68knommu)
>> - =A0 =A0 =A0 hdr-arch =A0 =A0 =A0 =A0:=3D m68k
>> + =A0 =A0 =A0 SRCARCH :=3D m68k
>> =A0endif
>>
>> +# Where to locate arch specific headers
>> +hdr-arch =A0 =A0 =A0 :=3D $(SRCARCH)
>> +
>> =A0KCONFIG_CONFIG ?=3D .config
>> =A0export KCONFIG_CONFIG
>
>
> I think it better to just remove the whole m68knommu conditional,
> since there is not longer a separate m68knommu arch branch.
>
> Regards
> Greg
>
>
> ---------------------------------------------------------------------=
---
> Greg Ungerer =A0-- =A0Principal Engineer =A0 =A0 =A0 =A0EMAIL: =A0 =A0=
 gerg@snapgear.com
> SnapGear Group, McAfee =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0PHO=
NE: =A0 =A0 =A0 +61 7 3435 2888
> 8 Gardner Close =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 FAX: =A0 =A0 =A0 =A0 +61 7 3217 5323
> Milton, QLD, 4064, Australia =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0WEB: http=
://www.SnapGear.com
