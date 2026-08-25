Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com [209.85.217.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8762F373BFE
	for <linux-m68k@lists.linux-m68k.org>; Tue, 25 Aug 2026 07:53:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787644414; cv=none; b=NLycRuP5KRkFWcvJnM/+Y5vENPb2MKV4Kmh9yaIqtBcZzxmKdimcFS+qTFZjemBVSKwYZWASNPLwqXkc/GegBDJj6DiSNN8eR3K6icGzd2YQ6fuWRbzr9+EkjnRArNH703Y/W+gF26fNsLVLAEb/861wgxbYQq1AC+hVwuMH5BQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787644414; c=relaxed/simple;
	bh=5KhXHGIN/5OkJ5Z05vnUucjZaP7hvHBv6uFtz8zGhxw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IiMLaVyxvi6E9bjqI17ckf5MSMOWIUaqwvu+glKx4c1U+sL6iz1SwbN7ZGXgCuo3yRkHxCQq4cgSQeq5AUS+GJzhP4aJqra2rqygQHpEfHQrwMMySxGAv+GOuucaM52RDZ35GVTtiHwfHkO5gWMPCNJIY7AKzB6DryfMVmKjG0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f42.google.com with SMTP id ada2fe7eead31-777ae5e5caeso1411022137.2
        for <linux-m68k@lists.linux-m68k.org>; Tue, 25 Aug 2026 00:53:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787644411; x=1788249211;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=mY3Cs/1+UNEYSIVcDUnJkc5JJKs/5ezwJVqk+SnL2Uk=;
        b=O4ML42NC8IypVHpBzqrkX/sasLRT9ZZnA1fQe7YVb9AfocYDEP7iOJpO2bv8UZcJQA
         r1iz3mLk7CaL9w5tFpoYcqXfDCBGa9K7dBSKMVOKq6pzGub9m7kKO7T0eF3qtB8DAJoa
         cddcSCfC8V1ELtaOYlHbXJgZQbopyoHGYRPwTXKijeyOzHxaazTBfVPfVQ/D8VwtH0Du
         z0ZrrDXVamZBBXDL33SBQw5m4ujAJwxZBHEJ7E9MzLTsjPvmn92G35wKWIzJbhkhCc2C
         MykETb7rsPwcjGj1oVK7Mh4adWKDIKMSXr5xZVxVpvQPDaDqiuZiEP5ilauOfoB5CHoX
         7fhg==
X-Forwarded-Encrypted: i=1; AHgh+Rq4GDaxE6R1oNpLMU0pEp9j4h/n1TRPNwnwSvd/O3vMbqI3oikR4w3jQVyBHFH06+BCFh8O+QwzMT2b@lists.linux-m68k.org
X-Gm-Message-State: AFuF++mL5/iWfnFyCRYD5LQP216S661cMIfjnOrYfB24KrqeuPefufRa
	De2Spcq4bjS16SlvOg3B/XTUf3DtV+Yr7utf1sCoEf/RfiESuveR/RYObq4Q9AdwwMg=
X-Gm-Gg: AR+sD12b3Ud4BLAC/05lYB5LqVn7aIJH9RpApr8YbEqCtG9ArI0AQOYxrp7+tvSzn1K
	NBccs+nzAjF/Tirv5tRppn5Yu0z9RfMwNNqupDYM7ko/osv7SYSlxSQAJYJQHjq0rtLPwh1gb7I
	t2COev38IgZMbp3NVlTwAAdv7QWvqwGUnbYh5YIkjDAk5FBClpL7x7XhaeyqMv2+zxH0ms2fkMu
	wZ6h33FTQEijI6Lcw/aRo1PM8m9I65B0owY6JTm/6S9r20bAYgOw/xTEbvZgGBxbfUaGInfzAkB
	rqRNvK53zCtDrH/qWzKx5yKlf+XL/gsRDXJ0QiEBDB26FTEfwkYub8aSVuWNOwTt/vzXo9Z+p5r
	3QXiy99QlE8PPTzA+2gqDP9cF7x8bL7RgyylUHlyK/uV65eTI5n0FawC+LnQJZvilgYyzgqvh/3
	qrbBJIrp3MDWqPfWYTFGgSwKhVgDuJbK5l4ixLK09gUCwnBGWokZ1HzpNd4Uz9AJZJsM5UxlBRR
	83H/txTMudtw45MIbbDzhDgRg==
X-Received: by 2002:a05:6102:e0d:b0:738:84c:6b3 with SMTP id ada2fe7eead31-77a62327a3dmr10074124137.3.1787644411070;
        Tue, 25 Aug 2026 00:53:31 -0700 (PDT)
Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com. [209.85.217.50])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-77d85beba4esm4837177137.10.2026.08.25.00.53.30
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Aug 2026 00:53:30 -0700 (PDT)
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-74aa416ebb1so1310943137.1
        for <linux-m68k@lists.linux-m68k.org>; Tue, 25 Aug 2026 00:53:30 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RpF21SOshGZcIUI032/ujSc9U4ssyQDfi6jAjZWBOx+L7RNQtDoTNLFKSg76H8B6eETxMZtMrzDB+HP@lists.linux-m68k.org
X-Received: by 2002:a05:6102:5107:b0:778:4c28:6725 with SMTP id
 ada2fe7eead31-77a6434bfc4mr9347978137.10.1787644410431; Tue, 25 Aug 2026
 00:53:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260824153339.512487-1-p.pisati@gmail.com> <20260824153339.512487-2-p.pisati@gmail.com>
In-Reply-To: <20260824153339.512487-2-p.pisati@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 25 Aug 2026 09:53:18 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVBjxXNX19k55Yu4D5GD1nkb31TuBJN0uFDqD9Oe5Gtsw@mail.gmail.com>
X-Gm-Features: AcwNN1XJGQsJg3rTyiIM7ZxTIkOAoql-OOJhHfZeWEVlRKB_glDBvnY_i5ovn3w
Message-ID: <CAMuHMdVBjxXNX19k55Yu4D5GD1nkb31TuBJN0uFDqD9Oe5Gtsw@mail.gmail.com>
Subject: Re: [PATCH v5 1/2] ata: pata_cswarp: Add Amiga cslab ata support
To: Paolo Pisati <p.pisati@gmail.com>
Cc: Damien Le Moal <dlemoal@kernel.org>, Niklas Cassel <cassel@kernel.org>, linux-ide@vger.kernel.org, 
	linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Paolo,

On Mon, 24 Aug 2026 at 17:33, Paolo Pisati <p.pisati@gmail.com> wrote:
> Driver for the on-board IDE interface on CS-Lab Warp Expansion Card
> (NOTE that idemode=native has to be set in Warp Configuration)
>
> Assisted-by: Claude_Code:claude-opus-5
> Signed-off-by: Paolo Pisati <p.pisati@gmail.com>

Thanks for the update!

> --- /dev/null
> +++ b/drivers/ata/pata_cswarp.c

> +static unsigned int pata_cswarp_data_xfer(struct ata_queued_cmd *qc,
> +                                         unsigned char *buf,
> +                                         unsigned int buflen, int rw)
> +{
> +       struct ata_device *dev = qc->dev;
> +       struct ata_port *ap = dev->link->ap;
> +       void __iomem *data_addr = ap->ioaddr.data_addr;
> +       unsigned int words = buflen >> 1;
> +       u16 *buf16 = (u16 *)buf;
> +
> +       /* Transfer multiple of 2 bytes */
> +       if (rw == READ)
> +               raw_insw(data_addr, buf16, words);
> +       else
> +               raw_outsw(data_addr, buf16, words);
> +
> +       /* Transfer trailing byte, if any. */
> +       if (unlikely(buflen & 0x01)) {
> +               if (rw == READ)
> +                       buf[buflen - 1] = raw_inw(data_addr) >> 8;
> +               else
> +                       raw_outw(buf[buflen - 1] << 8, data_addr);
> +               words++;
> +       }
> +
> +       return words << 1;

This may be one less than the actual number of bytes
Why not buflen?

> +}

> +static int pata_cswarp_probe(struct zorro_dev *z,
> +                            const struct zorro_device_id *ent)
> +{
> +       static const char board_name[] = "csWarp";
> +       struct ata_host *host;
> +       struct ata_port *ap;
> +       void __iomem *base;
> +       unsigned long board = z->resource.start;
> +
> +       dev_info(&z->dev, "%s IDE controller (board: 0x%lx)\n", board_name,
> +                board);
> +
> +       if (!devm_request_mem_region(&z->dev, board + WARP_OFFSET_ATA, 0x1800,
> +                                    DRV_NAME))
> +               return -ENXIO;
> +
> +       host = ata_host_alloc(&z->dev, 1);
> +       if (!host)
> +               return -ENXIO;
> +
> +       ap = host->ports[0];
> +       base = ioremap(board + WARP_OFFSET_ATA, 0x1800);
> +
> +       ap->ops = &pata_cswarp_ops;
> +
> +       ap->pio_mask = ATA_PIO4;
> +       ap->flags |= ATA_FLAG_SLAVE_POSS | ATA_FLAG_NO_IORDY |
> +               ATA_FLAG_PIO_POLLING;
> +
> +       ap->ioaddr.data_addr            = base;
> +       ap->ioaddr.error_addr           = base + 1 * 4;
> +       ap->ioaddr.feature_addr         = base + 1 * 4;
> +       ap->ioaddr.nsect_addr           = base + 2 * 4;
> +       ap->ioaddr.lbal_addr            = base + 3 * 4;
> +       ap->ioaddr.lbam_addr            = base + 4 * 4;
> +       ap->ioaddr.lbah_addr            = base + 5 * 4;
> +       ap->ioaddr.device_addr          = base + 6 * 4;
> +       ap->ioaddr.status_addr          = base + 7 * 4;
> +       ap->ioaddr.command_addr         = base + 7 * 4;
> +
> +       ap->ioaddr.altstatus_addr       = base + (0x1000 | (6UL << 2));
> +       ap->ioaddr.ctl_addr             = base + (0x1000 | (6UL << 2));
> +
> +       ata_port_desc(ap, "  cmd 0x%lx ctl 0x%lx", (unsigned long)base,
> +                     (unsigned long)ap->ioaddr.ctl_addr);

Both printed addresses are virtual addresses hence not really useful.
If you want to print something, please print board or z->resource
instead.

> +static const struct zorro_device_id pata_cswarp_zorro_tbl[] = {
> +       { ZORRO_PROD_CSLAB_WARP_1260, 0},
> +       { 0 }

Please use named initializers, and drop unneeded zeroes, like Uwe
just did in all existing Zorro drivers:

    { .id = ZORRO_PROD_CSLAB_WARP_1260 },
    { }

> +};

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
