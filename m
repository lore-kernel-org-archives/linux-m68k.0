From: Finn Thain <fthain@telegraphics.com.au>
Subject: Re: [PATCH 2/2] Add SWIM floppy support for m68k Macs.
Date: Wed, 5 Nov 2008 22:10:21 +1100 (EST)
Message-ID: <Pine.LNX.4.64.0811052151480.25360@loopy.telegraphics.com.au>
References: <12258061372635-git-send-email-laurent@lvivier.info>
 <12258061372626-git-send-email-laurent@lvivier.info>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from loopy.telegraphics.com.au ([202.45.126.152]:60275 "EHLO
	loopy.telegraphics.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754592AbYKELKY (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Wed, 5 Nov 2008 06:10:24 -0500
In-Reply-To: <12258061372626-git-send-email-laurent@lvivier.info>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Laurent Vivier <laurent@lvivier.info>
Cc: geert@linux-m68k.org, linux-m68k@vger.kernel.org



On Tue, 4 Nov 2008, Laurent Vivier wrote:

> +#define swim_write(base, reg, v) 	out_8(&(base)->write_##reg, (v))
> +#define swim_read(base, reg)		in_8(&(base)->read_##reg)
> +
> +/* bits in phase register */
> +
> +#define SEEK_POSITIVE	0x070
> +#define SEEK_NEGATIVE	0x074
> +#define STEP		0x071
> +#define MOTOR_ON	0x072
> +#define MOTOR_OFF	0x076
> +#define INDEX		0x073
> +#define EJECT		0x077
> +#define SETMFM		0x171
> +#define SETGCR		0x175
> +
> +#define RELAX		0x033
> +#define LSTRB		0x008
> +
> +#define CA_MASK		0x077
> +
> +/* Select values for swim_select and swim_readbit */
> +
> +#define STEP_DIR	0x070
> +#define STEPPING	0x071
> +#define MOTOR_ON	0x072

MOTOR_ON is defined twice. Are STEP & STEPPING the same?

> +#define ELAX		0x073	/* also eject in progress */
> +#define READ_DATA_0	0x074
> +#define TWOMEG_DRIVE	0x075
> +#define SINGLE_SIDED	0x076
> +#define DRIVE_PRESENT	0x077
> +#define DISK_IN		0x170
> +#define WRITE_PROT	0x171
> +#define TRACK_ZERO	0x172
> +#define TACHO		0x173
> +#define READ_DATA_1	0x174
> +#define MFM_MODE	0x175
> +#define SEEK_COMPLETE	0x176
> +#define ONEMEG_MEDIA	0x177
> +
> +/* Bits in handshake register */
> +
> +#define MARK_BYTE	0x01
> +#define CRC_ZERO	0x02
> +#define RDDATA		0x04
> +#define SENSE		0x08
> +#define MOTEN		0x10
> +#define ERROR		0x20
> +#define DAT2BYTE	0x40
> +#define DAT1BYTE	0x80
> +
> +/* bits in setup register */
> +
> +#define S_INV_WDATA	0x01
> +#define S_3_5_SELECT	0x02
> +#define S_GCR		0x04
> +#define S_FCLK_DIV2	0x08
> +#define S_ERROR_CORR	0x10
> +#define S_IBM_DRIVE	0x20
> +#define S_GCR_WRITE	0x40
> +#define S_TIMEOUT	0x80
> +
> +/* bits in mode register */
> +
> +#define CLFIFO		0x01
> +#define ENBL1		0x02
> +#define ENBL2		0x04
> +#define ACTION		0x08
> +#define	WRITE_MODE	0x10
> +#define	HEDSEL		0x20
> +#define	MOTON		0x80

There extra tabs are still here.

> +		break;
> +	default:
> +		swim_base = NULL;
> +		break;
> +	}
> +
> +	if (dev->id == 0 && base)
> +		swim_base = (struct swim *)base;
> +
> +	if (swim_base == NULL)
> +		return -ENODEV;

I think dev->id is always 0?

Finn
