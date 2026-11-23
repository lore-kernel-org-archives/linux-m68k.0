Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795422078;
	b=jRJDwfeFort/PsmyNPRgw75FYjPF1xe2usefrJ9V6iWNVPM96PmFXj9Ooi8B5vcanx4H
	 NLRftmgvxteJOKi3a+CRU+5KGN3w1MBa6FOKG8uwOKfs8jVXFmg1rxIevnrbZH5AE5M0o
	 dfPCpyXDRqhAhuoXPPPENaW7DzvHsLnVxaLsvuCX5NiNKaz7ygq8Am5sWXomVqUwpOxpp
	 kSfTNBP481bphCUSB3RQQ8/K1QKMiNfF2Xpzbasu7HW/WcvXVaV50PCZL51jjBZKZNwDg
	 55GIeN+enCLSezgee0AMxppuWeWnGbISDbx97tDeybii2kdYTs33PDp/Tn2dpqUYKxQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795422078;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=urV9PEPwEvrHK4qayGYwaVV8yhJ/QEoLReqAK4fiRYQ=;
	b=oG9/o7ZKlxAo26HDMwLjQWgWnbtGm+GdBwytH25Jd92Z2E8FcYeLljrV2MhCTKPaWNUt
	 QGadgEU8gKNBq2Wou3YGI+P4/cVIS6pHu8xdw3Grp/Xs3QbRP2kmCl2w1m3Wc0qghDVL1
	 XRMvok5FuIeqD64QYF/m71H1laIPSYts9v3O0xAcSTAgsO5x0ThiAY9dBGpvjbUch7dSE
	 M4qwDH7FUnXB24jcEb15mpgu5FCvbLsEg8ACU5pr5dfXk5hPhrIvs0NzyIdjGWOCxyxG3
	 sMHBBJZOGS/mQ4UXUj0id2vTTeoa7ovGWKTouBopYuZVRczmzhnJ0fx3zXTJWAB0/wA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.222.47
Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com [209.85.222.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40EA3606A32C
	for <linux-m68k@lists.linux-m68k.org>; Mon, 23 Nov 2026 08:21:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 40EA3606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f47.google.com with SMTP id a1e0cc1a2514c-98fea7e52b7so1879497241.0
        for <linux-m68k@lists.linux-m68k.org>; Mon, 23 Nov 2026 00:21:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795422077; x=1796026877;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=urV9PEPwEvrHK4qayGYwaVV8yhJ/QEoLReqAK4fiRYQ=;
        b=1BoRyF23gPFCgtNt1x2V8ugqCAvKPm3b34RK4kjdbHezFrPwx4qgM5XkPQyt3lj7GZ
         F34cbcnEoNbinpMkgAxkZyJq3D/g/ADrMyUckdobDi+mmQhEsOyhqAFzUMNeq7UV/a8s
         hxTLgVCjkcnrw8O6K7IS2KmSd52mB8bqpiaH/IMRdmJgZlX5NVdn2JFZ3Sw0QhYhUAtW
         JEyuior038/PuaEq8/ymcvOVrHACIp7ulHWNNaacD+OgyCC6w1IFaqXVEXHBv/pfqPpk
         Nw965TnBdsGvXuE9PoVyr6I1taIB4kNDxHoA0I5kWQ36j7k6Z+xBhN4J561vKu29ZKql
         c5/Q==
X-Forwarded-Encrypted: i=1; AL+hErGJv7jm49k3sW43VCmRNcqbuwdK9vT52tbI5lnLb28pZO4yLGvD4WtNRzFgDvczP95C7Rrm3+xXpKlu@lists.linux-m68k.org
X-Gm-Message-State: APuU4Z9dChqKnlJu6Lkt+9o2L7YBiu2qK30X/7E6/MHFwXMLUIShZehH
	vYdJ+PuJ3Ig8IHTJ1R7sfB3ZiyV0Svoml3Cfo6hRjIokrpM5xPbJ+BWn6RLdxaqe
X-Gm-Gg: AZFdTZe6cr5Ux22T7qwTNEczYWFMgg1cmZkGdCf/1USAHeGYr109v+o0J/WB9gFi4W3
	dqtiwGSJKEQBaoOhvbLV4tqs6fFYbbZX2PcGCLl8wz1EHGqqycTAFcMM53fDWhtDwid2PgcuvTH
	1q4A+rP4na6Ds7Qjh/7hh/MTE8PxkevCsKrJbPC4c4HVh1ks4XSQpe5HTpY5Fcazmcv30yd5bbF
	n/TuC+9ZfPofBXozNFSoiiYkCRpcZAwIlEK6F4apChR+h+bAhLJl0OLKXXDZh3OV1GuVlMFrrXb
	QKykVNXKtF7Jr6RDfz0NzOClxAOg6GE8cIFZmakCd2StRJ8eLR1PqKPlds9owZQFq9C+LVbAPJU
	sc8z+2jXhDX90AR+zs9BlHkBYyhWT4xvV4sgdlE0F6i0Bf4qR+f2zbfIKFaXk67pn5l9cWCBnEg
	LdCpRhlU0H3ywiWFBoc+rjh845CU3ZYZ0O/Sor8+91/fO/p6HncsOhDmc+7CGNxTsrlnEnJqyuP
	HBgUqovL3gHCrN5Lz+3w3M4+W7CPG2ePVUlrmwPfW8zFj4iouk35Og7xHgfmW8OR0rS0zKV6vrB
	EK0RwZ1l/AVbFYNsFe8ARelW+hUlr+dvP/05BmOqI0SDR81/XvX1mSDEA32sO5UnIIQ=
X-Received: by 2002:a05:6102:160a:b0:7cc:2946:7f80 with SMTP id ada2fe7eead31-7d73960c5a1mr4922139137.35.1795422077080;
        Mon, 23 Nov 2026 00:21:17 -0800 (PST)
Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com. [209.85.217.43])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7d6e7f3d7bcsm11002122137.4.2026.11.23.00.21.15
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 00:21:16 -0800 (PST)
Received: by mail-vs1-f43.google.com with SMTP id ada2fe7eead31-7d2b25786d9so1657122137.0
        for <linux-m68k@lists.linux-m68k.org>; Mon, 23 Nov 2026 00:21:15 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErG4UauoAQFvMnn0F2RffBEGEVjQKiSB4wIl5CFwIp//EVfR7nIfaw+Hylylj3+Rkm6IeNUS+nlgdO5E@lists.linux-m68k.org
X-Received: by 2002:a05:6102:84cc:20b0:7d8:869e:8e54 with SMTP id
 ada2fe7eead31-7d8869e8ec4mr1539357137.7.1795422075752; Mon, 23 Nov 2026
 00:21:15 -0800 (PST)
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Post: <mailto:linux-m68k@vger.kernel.org>
List-Help: <mailto:linux-m68k+help@vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-m68k+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261122160447.519889-1-zihengw03@163.com>
In-Reply-To: <20261122160447.519889-1-zihengw03@163.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 23 Nov 2026 09:21:04 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWxC7LNy3MTNYE62AoWBB6sHm9jKAsYKRjrZ+LfHjArtQ@mail.gmail.com>
X-Gm-Features: Aa3M54oDJAacN4ZgRznlESFwii2fz_UdwV-FQBJ6wD20kL1ynEn2pjnzqtgO3U0
Message-ID: <CAMuHMdWxC7LNy3MTNYE62AoWBB6sHm9jKAsYKRjrZ+LfHjArtQ@mail.gmail.com>
Subject: Re: [PATCH] scsi: 53c700: fix invalid frees in m68k driver remove paths
To: Ziheng Wei <zihengw03@163.com>
Cc: "James E . J . Bottomley" <James.Bottomley@hansenpartnership.com>, 
	"Martin K . Petersen" <mkp@kernel.org>, linux-scsi@vger.kernel.org, 
	linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org, Kars de Jong <jongk@linux-m68k.org>
Content-Type: text/plain; charset="UTF-8"

CC Kars

On Sun, 22 Nov 2026 at 17:05, Ziheng Wei <zihengw03@163.com> wrote:
> NCR_700_detect() stores the allocated host parameters in
> host->hostdata[0]. The m68k remove paths instead use shost_priv(host),
> which returns the address of the pointer slot and causes an interior free.
>
> Free the pointer stored in host->hostdata[0], as the other 53c700 drivers
> do.
>
> Found by LLM-assisted static analysis. Cross-compiled for m68k; no
> runtime test on the affected hardware.
>
> Fixes: a16efc1cbf0a ("[SCSI] 53c700: Amiga 4000T NCR53c710 SCSI")
> Fixes: 8276b58af4dd ("[SCSI] 53c700: m68k BVME6000 NCR53C710 SCSI")
> Fixes: 506c7bbcd9bc ("[SCSI] 53c700: m68k MVME16x NCR53C710 SCSI")
> Fixes: 45804fbb00ee ("[SCSI] 53c700: Amiga Zorro NCR53c710 SCSI")
> Cc: stable@vger.kernel.org
> Signed-off-by: Ziheng Wei <zihengw03@163.com>

LGTM, so
Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
