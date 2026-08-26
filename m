Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7875F37E5F6
	for <linux-m68k@lists.linux-m68k.org>; Wed, 26 Aug 2026 19:31:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787772700; cv=none; b=Lv9cuaoaR7ztsTrya2ddr9AczLdL2bjE8qO/jhC36ssoePWANys7TSae8vafrzlvOh0j6/r2jshg5ShqmQzBi/FIbAH5JrL4ldcpc3lPgGUMr6beqwVDoORSgibaq80xzQRVxjLZ1MLyf8hrCzHvmfx+rWsx6UfZJlhn6pp2qUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787772700; c=relaxed/simple;
	bh=SGfLYuzawYM7CArQUCVBEeD5eD6OckEYf0HNwbCiXAo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CkgAxIe6wk5/j8hrEqsGLhtGnIy3ZAyJjWDVVpbK8HXaCjzKHxR5NBRJN3Seje7g0PmJ3QLVW+MFTGfneSEOVuIxYWAn2DbZ86O/nJk0Dqt2236nswuiSzoM1oXRbAU/Tvi2dZ+19WXZH2lPgveAhf84gW4RhqDw6qMpBzGzDoA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cC6bAPWV; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cC6bAPWV"
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-cc1c8d4a959so780646a12.3
        for <linux-m68k@lists.linux-m68k.org>; Wed, 26 Aug 2026 12:31:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787772689; x=1788377489; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=87q+5ivROSLtYuJS4l3dPY+myx5uTzr/xnq7BAcE3WU=;
        b=cC6bAPWVoQ5ufO+abyETvqBs0+S1Npt/16+37oaUeYxQcHK70T7TccaAb5aICqg4qS
         NUO8EasQlbgmclOl75XV6Jgl3gjJ89nJAVELNfI9Q6oi93sfwFmrw63Dco1U6e7E7kA3
         5UQ50PCyEfy3TqgnlKOxEpEN/CxsxKRjrjWV4pVlpYidfS8aDrWVGUQB7rhymrDqVwjH
         hDbbP+NyQplpFKpTDLC2oOhC++7Jgul0gVFHurs9vU6OOahioVL7G6aXMiyIoLFyoAfA
         x/kGjndrTq2BI6b12/GAhZ6+3sYHZhke2ti3SH+BGrOyRXQ+paUqMk+ZbDhTfF1qhF2p
         HzkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787772689; x=1788377489;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=87q+5ivROSLtYuJS4l3dPY+myx5uTzr/xnq7BAcE3WU=;
        b=cr4MKzmRFgz4IPRmYZhiLcHY4WSJttgOrgu5og06sBOBSnFcFI6tQ4q/uMV/sfahwe
         G/IAD0jY2D70wnSOMbW7EMW5np8Be3ceY9Wyea1+dyHVjQmdA1gW3TY6S4wqOCCoMJZt
         mCjH2U48yha0YyEIIN+5D2j1kckhTGPImAw69SriffPtxYb84yXOshIrwthUQHyBy/c+
         jYOPMg/Us/vYH80WYEKYLg6xW2xnuKcmPPVlLDNH9TsFANtSTbPyT86y3O8LWuCNN5fP
         4nQ5GXQlU32Z8qaZ335su0gxL+rrtbZ0tH4oNgmFzuohQiGDXt2ybTXNatX7A/r1Yp2B
         aW1Q==
X-Forwarded-Encrypted: i=1; AHgh+Rper/zMFFjliN16hdN3cS9J9apwCZBDVfFmtHGphbIxI8PEEAVLMzuBzBrAKSNDp2A4KrEq/eLGrqlk@lists.linux-m68k.org
X-Gm-Message-State: AFuF++lvNLwnVS4uJIpEyuLiREqGI7B4iaJsGvwlJNyzkMAQS1Y46qcL
	9DZH6XvnWp+onENptVKvibV0OJ/vwyp5zP8fFNmCmDlPNwjMNrXq7rnY
X-Gm-Gg: AR+sD12TEpUSdEoOfBmM5rFsnC8MhfXOKNqO/9sgkc65tJFiRgMwTXqEr0FcGWklAB9
	9xPblSIKWneE84uGA4f2/7KP3jzLapAyYCHUdLRXulZGf+40d95w2ymwk/Os6X6hCA19cZ+0YTr
	FHGrzK4S7vuVM7K2a/EBmNn0tA/Vs1Bsk2YVAVEVfo9M3C4jNC+amyK1+c1rIJVI73wmFPcYBIm
	odmgv+FlAW8Y3QJHNTRY5rGz3QSMvX4O93AQjow6IO3uQi3DE37EzQS7B9f7mx9H2oWNgfLCR/y
	g8X6Fa9XjG9XQnmX7Q0AaXeVwTSb4jnAxDOnFm3GutNuh5WoN/VxM3wkHHQvg7SiYyQKBPtJYmX
	K7O17OAjOTeknMLMwLSQYqrM0Dn6JDVYHDGXEqqQ0K0d4wZJDpfGFErBEIoxx/wfs2XYzaUn7BU
	lDxPGK5x3wC76x+VRLP9eglt6yFerivcOA6CYCI5Alv6UwkC0nzsaYSFZstrJOe4vEs8mwoS6iK
	ELJY5e/KjOuw18fVYfFbCpznkgu9Ev0e4l/WvQh8crhbuMncgvuFwQczGh/jl3832Twqhnihq3D
X-Received: by 2002:a17:90b:4b0f:b0:37f:e1b6:4c7d with SMTP id 98e67ed59e1d1-3966d1d9579mr17435841a91.6.1787772688569;
        Wed, 26 Aug 2026 12:31:28 -0700 (PDT)
Received: from ?IPV6:2001:df0:0:200c:b984:9fe3:5dce:f291? ([2001:df0:0:200c:b984:9fe3:5dce:f291])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3965547159asm7952454a91.12.2026.08.26.12.31.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Aug 2026 12:31:28 -0700 (PDT)
Message-ID: <b010c98c-ecd5-439c-b07d-3efad26de7f2@gmail.com>
Date: Thu, 27 Aug 2026 07:31:22 +1200
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/2] ata: pata_cswarp: Add Amiga cslab ata support
To: Geert Uytterhoeven <geert@linux-m68k.org>,
 Paolo Pisati <p.pisati@gmail.com>
Cc: Damien Le Moal <dlemoal@kernel.org>, Niklas Cassel <cassel@kernel.org>,
 linux-ide@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
 linux-kernel@vger.kernel.org
References: <20260824153339.512487-1-p.pisati@gmail.com>
 <20260824153339.512487-2-p.pisati@gmail.com>
 <CAMuHMdVBjxXNX19k55Yu4D5GD1nkb31TuBJN0uFDqD9Oe5Gtsw@mail.gmail.com>
Content-Language: en-US
From: Michael Schmitz <schmitzmic@gmail.com>
In-Reply-To: <CAMuHMdVBjxXNX19k55Yu4D5GD1nkb31TuBJN0uFDqD9Oe5Gtsw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Geert,

On 25/08/26 19:53, Geert Uytterhoeven wrote:
>> +static unsigned int pata_cswarp_data_xfer(struct ata_queued_cmd *qc,
>> +                                         unsigned char *buf,
>> +                                         unsigned int buflen, int rw)
>> +{
>> +       struct ata_device *dev = qc->dev;
>> +       struct ata_port *ap = dev->link->ap;
>> +       void __iomem *data_addr = ap->ioaddr.data_addr;
>> +       unsigned int words = buflen >> 1;
>> +       u16 *buf16 = (u16 *)buf;
>> +
>> +       /* Transfer multiple of 2 bytes */
>> +       if (rw == READ)
>> +               raw_insw(data_addr, buf16, words);
>> +       else
>> +               raw_outsw(data_addr, buf16, words);
>> +
>> +       /* Transfer trailing byte, if any. */
>> +       if (unlikely(buflen & 0x01)) {
>> +               if (rw == READ)
>> +                       buf[buflen - 1] = raw_inw(data_addr) >> 8;
>> +               else
>> +                       raw_outw(buf[buflen - 1] << 8, data_addr);
>> +               words++;
>> +       }
>> +
>> +       return words << 1;
> This may be one less than the actual number of bytes
> Why not buflen?
>
words = buflen >> 1;

followed by

if (buflen & 0x01) words++;

makes 'words' the correct (i.e. rounded upwards if buflen was odd) 
number of words transferred.

The return value is then either correct, or one larger than the actual 
number of bytes?

I believe the template for these functions was 
drivers/ata/libata-sff.c:ata_sff_data_xfer() which follows the exact 
same logic.

Cheers,

MIchael

>> +}
>> +static int pata_cswarp_probe(struct zorro_dev *z,
>> +                            const struct zorro_device_id *ent)
>> +{
>> +       static const char board_name[] = "csWarp";
>> +       struct ata_host *host;
>> +       struct ata_port *ap;
>> +       void __iomem *base;
>> +       unsigned long board = z->resource.start;
>> +
>> +       dev_info(&z->dev, "%s IDE controller (board: 0x%lx)\n", board_name,
>> +                board);
>> +
>> +       if (!devm_request_mem_region(&z->dev, board + WARP_OFFSET_ATA, 0x1800,
>> +                                    DRV_NAME))
>> +               return -ENXIO;
>> +
>> +       host = ata_host_alloc(&z->dev, 1);
>> +       if (!host)
>> +               return -ENXIO;
>> +
>> +       ap = host->ports[0];
>> +       base = ioremap(board + WARP_OFFSET_ATA, 0x1800);
>> +
>> +       ap->ops = &pata_cswarp_ops;
>> +
>> +       ap->pio_mask = ATA_PIO4;
>> +       ap->flags |= ATA_FLAG_SLAVE_POSS | ATA_FLAG_NO_IORDY |
>> +               ATA_FLAG_PIO_POLLING;
>> +
>> +       ap->ioaddr.data_addr            = base;
>> +       ap->ioaddr.error_addr           = base + 1 * 4;
>> +       ap->ioaddr.feature_addr         = base + 1 * 4;
>> +       ap->ioaddr.nsect_addr           = base + 2 * 4;
>> +       ap->ioaddr.lbal_addr            = base + 3 * 4;
>> +       ap->ioaddr.lbam_addr            = base + 4 * 4;
>> +       ap->ioaddr.lbah_addr            = base + 5 * 4;
>> +       ap->ioaddr.device_addr          = base + 6 * 4;
>> +       ap->ioaddr.status_addr          = base + 7 * 4;
>> +       ap->ioaddr.command_addr         = base + 7 * 4;
>> +
>> +       ap->ioaddr.altstatus_addr       = base + (0x1000 | (6UL << 2));
>> +       ap->ioaddr.ctl_addr             = base + (0x1000 | (6UL << 2));
>> +
>> +       ata_port_desc(ap, "  cmd 0x%lx ctl 0x%lx", (unsigned long)base,
>> +                     (unsigned long)ap->ioaddr.ctl_addr);
> Both printed addresses are virtual addresses hence not really useful.
> If you want to print something, please print board or z->resource
> instead.
>
>> +static const struct zorro_device_id pata_cswarp_zorro_tbl[] = {
>> +       { ZORRO_PROD_CSLAB_WARP_1260, 0},
>> +       { 0 }
> Please use named initializers, and drop unneeded zeroes, like Uwe
> just did in all existing Zorro drivers:
>
>      { .id = ZORRO_PROD_CSLAB_WARP_1260 },
>      { }
>
>> +};
> Gr{oetje,eeting}s,
>
>                          Geert
>
