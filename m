From: Laurent Vivier <laurent@lvivier.info>
Subject: Re: [PATCH 2/2][v3] Add SWIM floppy support for m68k Macs.
Date: Sun, 9 Nov 2008 20:14:52 +0100
Message-ID: <914807AF-2B1B-4E28-BB75-8E1FAA5463C5@lvivier.info>
References: <12260012691527-git-send-email-laurent@lvivier.info> <Pine.LNX.4.64.0811091716590.19341@anakin>
Mime-Version: 1.0 (Apple Message framework v929.2)
Content-Type: text/plain; charset=ISO-8859-1;
	format=flowed	delsp=yes
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from moutng.kundenserver.de ([212.227.126.186]:57351 "EHLO
	moutng.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755643AbYKITUS convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sun, 9 Nov 2008 14:20:18 -0500
In-Reply-To: <Pine.LNX.4.64.0811091716590.19341@anakin>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Linux/m68k <linux-m68k@vger.kernel.org>


Le 9 nov. 08 =E0 17:19, Geert Uytterhoeven a =E9crit :

> On Thu, 6 Nov 2008, Laurent Vivier wrote:
>> --- /dev/null
>> +++ b/drivers/block/swim.c
>
>> +static struct platform_device *swim_device;
>
> One global instance?


Yes, why not ? Could you explain ?

>
>
>> +static int __devinit swim_probe(struct platform_device *dev)
>> +{
>> +	struct swim *swim_base;
>> +	struct swim_priv *swd;
>> +
>> +	if (!MACH_IS_MAC)
>> +		return -ENODEV;
>> +
>> +	switch (macintosh_config->floppy_type) {
>> +	case MAC_FLOPPY_SWIM_ADDR1:
>> +		swim_base =3D (struct swim *)(VIA1_BASE + 0x1E000);
>> +		break;
>> +	case MAC_FLOPPY_SWIM_ADDR2:
>> +		swim_base =3D (struct swim *)(VIA1_BASE + 0x16000);
>> +		break;
>> +	default:
>> +		swim_base =3D (struct swim *)base;
>> +		break;
>> +	}
>> +
>> +	if (swim_base =3D=3D NULL)
>> +		return -ENODEV;
>> +
>> +	printk(KERN_INFO "SWIM base adress 0x%p\n", swim_base);
>> +
>> +	/* probe device */
>> +
>> +	set_swim_mode(swim_base, 1);
>> +	if (!get_swim_mode(swim_base)) {
>
> get_swim_mode() is also written in assembly. Is plain C not fast =20
> enough?
> If speed matters, what about disabling interrupts here?

I can rewrite it in C.

Regards,
Laurent

----------------------- Laurent Vivier ----------------------
"The best way to predict the future is to invent it."
- Alan Kay





--
To unsubscribe from this list: send the line "unsubscribe linux-m68k" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
