From: Laurent Vivier <laurent@lvivier.info>
Subject: Re: [PATCH 2/2] Add SWIM floppy support for m68k Macs.
Date: Wed, 5 Nov 2008 16:53:18 +0100
Message-ID: <65B5034D-7911-45D4-B013-75EA92922608@lvivier.info>
References: <12258061372635-git-send-email-laurent@lvivier.info> <12258061372626-git-send-email-laurent@lvivier.info> <Pine.LNX.4.64.0811052151480.25360@loopy.telegraphics.com.au>
Mime-Version: 1.0 (Apple Message framework v929.2)
Content-Type: text/plain; charset=ISO-8859-1;
	format=flowed	delsp=yes
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from moutng.kundenserver.de ([212.227.126.177]:59946 "EHLO
	moutng.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752540AbYKEPxi convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Wed, 5 Nov 2008 10:53:38 -0500
In-Reply-To: <Pine.LNX.4.64.0811052151480.25360@loopy.telegraphics.com.au>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Finn Thain <fthain@telegraphics.com.au>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Linux/m68k <linux-m68k@vger.kernel.org>


Le 5 nov. 08 =E0 12:10, Finn Thain a =E9crit :

>
>
> On Tue, 4 Nov 2008, Laurent Vivier wrote:
>
>> +#define swim_write(base, reg, v) 	out_8(&(base)->write_##reg, (v))
>> +#define swim_read(base, reg)		in_8(&(base)->read_##reg)
>> +
>> +/* bits in phase register */
>> +
>> +#define SEEK_POSITIVE	0x070
>> +#define SEEK_NEGATIVE	0x074
>> +#define STEP		0x071
>> +#define MOTOR_ON	0x072
>> +#define MOTOR_OFF	0x076
>> +#define INDEX		0x073
>> +#define EJECT		0x077
>> +#define SETMFM		0x171
>> +#define SETGCR		0x175
>> +
>> +#define RELAX		0x033
>> +#define LSTRB		0x008
>> +
>> +#define CA_MASK		0x077
>> +
>> +/* Select values for swim_select and swim_readbit */
>> +
>> +#define STEP_DIR	0x070
>> +#define STEPPING	0x071
>> +#define MOTOR_ON	0x072
>
> MOTOR_ON is defined twice. Are STEP & STEPPING the same?

In fact, I took this from swim3 driver.
Values used here (with swim_select() and swim_readbit()) are closely =20
linked with values defined for phase register.
But I think it is a good idea to rename them.

>
>
>> +#define ELAX		0x073	/* also eject in progress */
>> +#define READ_DATA_0	0x074
>> +#define TWOMEG_DRIVE	0x075
>> +#define SINGLE_SIDED	0x076
>> +#define DRIVE_PRESENT	0x077
>> +#define DISK_IN		0x170
>> +#define WRITE_PROT	0x171
>> +#define TRACK_ZERO	0x172
>> +#define TACHO		0x173
>> +#define READ_DATA_1	0x174
>> +#define MFM_MODE	0x175
>> +#define SEEK_COMPLETE	0x176
>> +#define ONEMEG_MEDIA	0x177
>> +
>> +/* Bits in handshake register */
>> +
>> +#define MARK_BYTE	0x01
>> +#define CRC_ZERO	0x02
>> +#define RDDATA		0x04
>> +#define SENSE		0x08
>> +#define MOTEN		0x10
>> +#define ERROR		0x20
>> +#define DAT2BYTE	0x40
>> +#define DAT1BYTE	0x80
>> +
>> +/* bits in setup register */
>> +
>> +#define S_INV_WDATA	0x01
>> +#define S_3_5_SELECT	0x02
>> +#define S_GCR		0x04
>> +#define S_FCLK_DIV2	0x08
>> +#define S_ERROR_CORR	0x10
>> +#define S_IBM_DRIVE	0x20
>> +#define S_GCR_WRITE	0x40
>> +#define S_TIMEOUT	0x80
>> +
>> +/* bits in mode register */
>> +
>> +#define CLFIFO		0x01
>> +#define ENBL1		0x02
>> +#define ENBL2		0x04
>> +#define ACTION		0x08
>> +#define	WRITE_MODE	0x10
>> +#define	HEDSEL		0x20
>> +#define	MOTON		0x80
>
> There extra tabs are still here.
>

Yes, sorry, I correct this (again...).

>> +		break;
>> +	default:
>> +		swim_base =3D NULL;
>> +		break;
>> +	}
>> +
>> +	if (dev->id =3D=3D 0 && base)
>> +		swim_base =3D (struct swim *)base;
>> +
>> +	if (swim_base =3D=3D NULL)
>> +		return -ENODEV;
>
> I think dev->id is always 0?

Yes, but as platform driver allows to have several instance of =20
platform device I though if we suppose we have several SWIM we should =20
use the module parameter only with the first one.
I can remove this if you think it is useless.

Thank you for your comments.

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
