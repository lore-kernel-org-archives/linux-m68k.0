Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 368353C465
	for <linux-m68k@lists.linux-m68k.org>; Mon, 26 May 2025 14:03:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748268219; cv=none; b=ZcXhTFgtOzx1IahW2Rkr4KdvIQUiZdkW+gBHM57XR/pwphiZjcS0WLt23na1GN8x/hZOl+6suspaFmoqkDuwSr4K5sCNgHf92SANsvrSs4yRs6yis0j1zWwz+VkVRN+nPXwAkk74js2lUo5K2mk4Wf7zYKD58ebfbY78VONS9tU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748268219; c=relaxed/simple;
	bh=4uwmKY8ceyp5QZIETjyzQVGHEV2zJROKskLaX8nRfK8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LRfeeSNSmrQJ6srUHY/+JmVvQI6yQfJljWua+TmD73PA5LOVnNcmnG1JPPj/MTvwi4cqn9D9gFTVtgrYv1vpvRUNI8ZerkaryH5hVuTncKwic7JkkCM4AdLzFiAs/wM2wRSdt688ybesfZT+LLrbHf3OA01qmI+9oD1P7sljA8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.160.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-4775ccf3e56so34747251cf.0
        for <linux-m68k@lists.linux-m68k.org>; Mon, 26 May 2025 07:03:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748268217; x=1748873017;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vCDcsKvq+RIBVrcv2PcCRyfsJ/lOeLLPLluC6HPp9QY=;
        b=P8Uor5KxemleM5VGnizFTw3+JfD6oRmyOZSMqbdff6kUUrBjaWTOWdu4guRScNfAaT
         silQGqusiLSPiDfC5lVYNEfdXnI6YH4z5K5OzQ+c6Uw0OaLJUBBb69HFnbsvVNKCyAGP
         4G4ROW4v4cm94TNYXpHy8EpO/p0FxurQYB4sa8+ckfuUFhOJ8MHkSO0OmuCsaKaC1ytP
         d6jN0I92wZnJBXJISsg9eqJ9sRBg0DnZPU6k/2MmdthASkMMhC0lT76tet6hyc9jnewl
         mDoa99Ml6qAuPH/Jgo5dtadikeGFh1L7pTsp+BoJ1DWavlGOM/Tx/C7jfqcIpl/hhn6P
         32Tg==
X-Forwarded-Encrypted: i=1; AJvYcCVMtp7gozdX9BJsiYsEOMmFq/HWGsSZAdLNnQm+AlHz3fZglCb190Y4fmRfPYONgzZjZa2gTXF0Ijb7@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YxCZ3LFjshcmq3PDpq6qpH1F1012OdM17RuVCxmEp1heTKokQCX
	dADmoWQ0/d74YbcqqsbikD/sdSsV+t/xDKmrhacsS+JJLReu55ldMKNSPjoqtdBh
X-Gm-Gg: ASbGncvTHFYAQvRu94BaSX5nip8bVtcSSxNe28iZOWQbNQcPY27XhJI1EPQWq1ivWL5
	uGUg963JnrmrSwMNAXE0mdfAZTMpx8rmNO76lopbTrfbMle7aLqzCo9jtpUta0IkSqoPezB/Ptv
	BpD/1I5YjePDZ0teMooueOmatVTx2JAqlVRlbP0frcL7K6oY2o45DQy/XunoT3YbeGnN7Vw4cL5
	f+x786ZcP6KrmFIxuY+AQO+WjU1hdv0ywdYPh+B7ySqOvW7Aou8+IM3jvePocnwd5rdHnElXFy2
	ZFrC5LKejYJHdndv2Mi6+Fli7WjZqWk+CAYk6yvvk2wOudNJfqrDtCZp/gBSqau3PDt/KRRVYg4
	brhMTxfdPQdwhBzHADQ==
X-Google-Smtp-Source: AGHT+IGZg8aGS8rT7tVz1H4eiUE77p51810mCVbsp6wrBUr9LnoK4EWALdueHgy0jopqXzxj9V8hdw==
X-Received: by 2002:a05:6820:818e:b0:606:3abb:1934 with SMTP id 006d021491bc7-60b9f9373ccmr4998930eaf.2.1748268197555;
        Mon, 26 May 2025 07:03:17 -0700 (PDT)
Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com. [209.85.167.179])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-609f3000cfasm4518514eaf.25.2025.05.26.07.03.16
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 May 2025 07:03:17 -0700 (PDT)
Received: by mail-oi1-f179.google.com with SMTP id 5614622812f47-400fa6b3012so1912658b6e.1
        for <linux-m68k@lists.linux-m68k.org>; Mon, 26 May 2025 07:03:16 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWhqr1xggJwhcdulWBaMfThwi6DOsZHLqc0HLrbIKi2Gy1BDGCDNzBzjnMQ7yBxo6Eb/fwZJ/UHOUO6@lists.linux-m68k.org
X-Received: by 2002:a05:6808:251a:b0:401:bb42:700c with SMTP id
 5614622812f47-4063d081bb6mr7483547b6e.19.1748268196551; Mon, 26 May 2025
 07:03:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250325155613.352680-1-p.pisati@gmail.com> <20250325155613.352680-2-p.pisati@gmail.com>
In-Reply-To: <20250325155613.352680-2-p.pisati@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 26 May 2025 16:03:04 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXyEyPMfd4wcqY+zfaqP0HeYBaDys_Twr9CEUxoNmisJA@mail.gmail.com>
X-Gm-Features: AX0GCFs7dpfswD8kmPFapTEn6ylOYXr6DaNHDFXbjxZW0U0ngEUN35FxjwqP30U
Message-ID: <CAMuHMdXyEyPMfd4wcqY+zfaqP0HeYBaDys_Twr9CEUxoNmisJA@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] ata: pata_cswarp: Add Amiga cslab ata support
To: Paolo Pisati <p.pisati@gmail.com>
Cc: Damien Le Moal <dlemoal@kernel.org>, Niklas Cassel <cassel@kernel.org>, linux-ide@vger.kernel.org, 
	linux-m68k@lists.linux-m68k.org
Content-Type: text/plain; charset="UTF-8"

Hi Paolo,

On Tue, 25 Mar 2025 at 16:56, Paolo Pisati <p.pisati@gmail.com> wrote:
> Driver for the on-board IDE interface on CS-Lab Warp Expansion Card
> (NOTE that idemode=native has to be set in Warp Configuration)
>
> Signed-off-by: Paolo Pisati <p.pisati@gmail.com>

Thanks for your patch!

> --- a/drivers/ata/Kconfig
> +++ b/drivers/ata/Kconfig
> @@ -1025,6 +1025,17 @@ config PATA_GAYLE
>
>           If unsure, say N.
>
> +config PATA_CSWARP
> +       tristate "Amiga CS Warp PATA support"
> +       depends on M68K && AMIGA && ZORRO
> +       help
> +         This option enables support for the on-board IDE interface on
> +         CS-Lab Warp Expansion Card (NOTE that idemode=native has to be
> +         set in Warp Configuration)
> +
> +         If unsure, say N.
> +
> +

Please drop one blank line.

>  config PATA_BUDDHA
>         tristate "Buddha/Catweasel/X-Surf PATA support"
>         depends on ZORRO

> index 000000000000..e0a0db6f7cfd
> --- /dev/null
> +++ b/drivers/ata/pata_cswarp.c

> +static unsigned int pata_cswarp_data_xfer(struct ata_queued_cmd *qc,
> +                                        unsigned char *buf,
> +                                        unsigned int buflen, int rw)
> +{
> +       struct ata_device *dev = qc->dev;
> +       struct ata_port *ap = dev->link->ap;
> +       volatile void __iomem *data_addr = ap->ioaddr.data_addr;
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
> +               unsigned char pad[2] = { };
> +
> +               /* Point buf to the tail of buffer */
> +               buf16 += words;
> +
> +               if (rw == READ) {
> +                       *pad = raw_inw(data_addr);
> +                       *buf16 = pad[0];

This looks wrong to me: as *pad is the same as pad[0], you could just
eliminate the pad[] intermediate...
Moreover, this writes one byte too much into the buffer.

> +               } else {
> +                       pad[0] = *buf16;
> +                       raw_outw(*pad, data_addr);
> +               }

Comparing to what v3 did, I think you want:

    if (rw == READ)
            buf[buflen-1] = raw_inw(data_addr) >> 8;
    else
            raw_outw(buf[buflen-1] << 8, data_addr);

As all Amigas are big-endian, I think there is no need to implement
this using some endian conversion function.

> +       }
> +
> +       return buflen;
> +}

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
