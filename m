Received: from mail-yx2-f12.google.com (mail-yx2-f12.google.com [74.125.224.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41BFC46EF96
	for <linux-m68k@vger.kernel.org>; Mon,  7 Sep 2026 10:53:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788778402; cv=pass; b=P4I2KhlPFRMAnHaCzU9xZWNjKLWKbLK2VIsYkkDBtYzzNNgsKi3w2x0XbB97834IVk0J1bqZ8m4X2e1RfwhW4PJUu5DQP0CGqmIwf073w5PtmL+H66/NwEqBaIPeNOw5S1GUkdbm8cSwSLu1yXcvbYaAXYL6ZwzYRAQtqMtpbr4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788778402; c=relaxed/simple;
	bh=peU35ZYj1X3Dgh+cySipeAPY9Jax8B5jb7s6N9e5cSw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iovOSK7SBkKxNroZFaSvTmKW8/knHb6PKuldS5TP6m5ntEXaP0OS/Ig+2y5WFQrAosVxgvRgVKFeudAgLc6zJvXT8fVVfw0+0Va0+y+jL41C21sjjTYYL2pkgK/ksz68pSjQ0CEtccrRxmepUvwbGgT5tpI26AB3tMVKqhFSMxU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VLAdY+KO; arc=pass smtp.client-ip=74.125.224.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VLAdY+KO"
Received: by mail-yx2-f12.google.com with SMTP id 956f58d0204a3-66e4ab1b9f7so23168d50.1
        for <linux-m68k@vger.kernel.org>; Mon, 07 Sep 2026 03:53:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788778400; cv=none;
        d=google.com; s=arc-20260327;
        b=XGQZQSQTYtPUBPsM2aEdo9UP1sBRbSn9ot+0sWbUpmhYCa2P+DDiKxrFhjn3m2vnd4
         gWWgoPo7lzG6/aUVME4pTl0hVTq5J2O9gLmb5L/z3FfPCG7uokUNJX5IOkg5gRpsRZj9
         ltOStYUuafAbGsBPRJbobgUa4hRWjqqzeGFW0Nc5FqYl7hVrhuBm1BMiz9PSRHG3Fxqo
         AuU0ZTj4C3NpKkv3MRPtgBNUYVIwFQPSpy4wieD4vVu6K9CXAIhe+dCHwZmVvRtgTW9L
         NS7FRXn8e7Uelz1LJlFc1tQm1Fhqfa6Q4jI33Bq5N5RaijutBRTfIp6dCfqBKag++VFn
         4toQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=t0j/VD2Uqr2WAt83wy0LI9ikA6saZfXkervge2kpEdk=;
        fh=3OY6Jci9GaThZkt92u2OEjVNmV8LDmsWnhwnRUyEs+Q=;
        b=KFnE6QqEzKi/yknNWPVzZTebXXCjh4Xl3JifZdhVMKOVlzMjsbIkjnBzWH9qqCtcF6
         wzrVnqwvr3erLDjRKrlc6bf+SsKRirKZVi7VF2cYiZioA63IqGJsqjytzppbq/009giP
         npZyUikH11DNKei7RBEdT8OHDisrGDYLXfC7L5hiH+MjQjHbDhzCh2pveRzxAscFYWl6
         o45ZnSpuCceybDjge2DI3+k+nThAMkeV0ra3aUqcdrpOt8N/U+ChdGirzcmOXKyK8aEg
         J/caAqy7xnQO4yWN1ZDv6ByEPgjKQtdVAjL3Eu1uNzZ6hPARgB9F1t03mZttp14JNu+J
         m2aQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788778400; x=1789383200; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=t0j/VD2Uqr2WAt83wy0LI9ikA6saZfXkervge2kpEdk=;
        b=VLAdY+KOoI02B4bD/RMyWlliCzK9A0LTggajRixE4bocZs/LEDV9vXnZoS5cHzRGr+
         99Y68ixDRnisw9Q06WndeDO1khuuW1ce46SaAiBc0a2PrUOYMWjrpOB0c4f3+sE8sWR8
         Fsl1UppEEj1n+lzU0jKtRfVFSkb3Az1ju+JXt1p9K1J7buEr/AYxPWHHVtAVUxJeMa3E
         8ZStjzyD0hZWfk9/FtYvB8aUc/wF/ZIZ3N0zGM3rTZoRJ//RQ6bQgQ2qrThPDCwkHi68
         0XNkl1OhDDS3KlhRdjeDykuM/sRIiQxusqKY7LoZxCU6IHgeZ1IjOAEksjWEpsh6/kbM
         oWbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788778400; x=1789383200;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=t0j/VD2Uqr2WAt83wy0LI9ikA6saZfXkervge2kpEdk=;
        b=CozTk+v1RxBCn+6sAaQYugJYeRgtQDDseWAVH74U9SMNPTzKJx4lR4s9gHNsWCQLxg
         qQ1UVEEqm1GHFG6BuBLxCMfp9P6119ykglp3vqEOw5bnJ4OFPoEZsXvCek+DN5OstRuG
         6/0JXNl5laKlU3+Drc+tHnZMpr5B2l1CGaBoX3uLmnx9hTN+4J9zcUVEnDzMZ0vR/pch
         z+hDPt/MWF2//4griJ4Gc+4h2HBPXV0DZ0LnX0wnfZ2DNEpkYf5J2TF1XVWgubZ4BT8P
         XNOFBzavqdIzG1uenGjIj6CykMGVoKuK3XO55Sa3FmENtYkn41JjejfHplP77Yyllpob
         zE4w==
X-Gm-Message-State: AFuF++m3DlZRX3WfBClUtRKV3GJ8GGqwm7D4ghoJMrpkN9XWczarTzTN
	xDOS0TIqmp1Upf8T9iJcq+RcgRHhl0Hv3vyg3PrAfYVAJMrDDCh3zau6CbHvri3PftW1TDCKAqd
	1dym4CAWDHt24Yx4kWl+j4dLNpq9d+t8=
X-Gm-Gg: AYBFou0ojh7h6nOKnJ5t3pqHlFssH1P2zmfIVjF4IUCxetdH4SCe4wuWihkxc096pHw
	iHTcscks43wH2GwWOntvyVl97xgGlQcpuAloXLmMCloGHNtJuBbGTV5fPglCkJFuuWzSMyzzUVY
	NDXAMBZyPKs9anxCE4ehZ5kWrm0zLhzbj2CpBPkQT47KNgr8cJDiFsKqdL8xrOuYhZEb8ojXJRF
	3X8hoGm505XdTH9M5Ahvq5uoxlj882Gzw6JQkZVXua8rkWAB+Nle2Jv7msxUX9JKOVboVG+e4Jn
	N4PiM6ddA+SUBUqGek73nTGJ7DF0sWECA/LrqW4CHagi2FPlSN9Q24013y2EAsYnaBZsZtSVJTm
	mk2wqNxvsOCXoM+YEIZ+w3jG/ENoUzSvC71tuuYvQsV4+DMttm1JlwM58W85Q1QMMwtoXDaAucs
	CzjiXjwelEl02jpY1k8UXsVUB5DyUGYvxixLhwJ+NXV9U=
X-Received: by 2002:a05:690e:d0e:b0:66e:3e4c:b764 with SMTP id
 956f58d0204a3-670f49391c0mr41147d50.11.1788778400126; Mon, 07 Sep 2026
 03:53:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260816073752.16656-1-schmitzmic@gmail.com> <20260816073752.16656-6-schmitzmic@gmail.com>
 <CAMuHMdWKqtNd1iGNsXcF6NUQjF6bZPp8YMPWB3y7++2VpwZd-w@mail.gmail.com>
In-Reply-To: <CAMuHMdWKqtNd1iGNsXcF6NUQjF6bZPp8YMPWB3y7++2VpwZd-w@mail.gmail.com>
From: =?UTF-8?B?TWlybyBLcm9ww6HEjWVr?= <miro.kropacek@gmail.com>
Date: Mon, 7 Sep 2026 20:53:03 +1000
X-Gm-Features: AcwNN1VW28DiSg6h2GoX7aOqe4tFoA8eEamCDw0hT-Zs7SX8T4Q0f9MHzM42jQ8
Message-ID: <CAN5rfbTuQj_EA7kNuNfNkTFadQ6gQTsPsf_XJkyQrM1CCcCMnw@mail.gmail.com>
Subject: Re: [PATCH v2 5/5] m68k: Add support for Svethlana
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@vger.kernel.org, Michael Schmitz <schmitzmic@gmail.com>
Content-Type: text/plain; charset="UTF-8"

Hi Geert,

On Mon, 17 Aug 2026 at 17:14, Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>
> Hi Miro,
>
> On Sun, 16 Aug 2026 at 09:38, Michael Schmitz <schmitzmic@gmail.com> wrote:
> > From: Miro Kropacek <miro.kropacek@gmail.com>
> >
> > The SuperVidel FPGA contains an OpenCore ethernet package. Add
> > platform device data and other necessary definitions to support
> > this device on Atari.
> >
> > The ethoc module must be enabled separately by the user.
>
> ETHOC selects MII and PHYLIB. Do you need to enable any MDIO or PHY
> drivers?  I don't have the hardware, just asking for {atari,multi}_defconfig.

The PHY on the SVEthlana reports id 0x00221513, which is a Micrel
KSZ8041 (PHY_ID_KSZ8041 = 0x00221510 plus revision 3). I tested both
ways: phylib's Generic PHY fallback drives it fine at 100 Mbps/Full,
so defconfig needs nothing beyond what ETHOC already selects, and with
CONFIG_MICREL_PHY=y the Micrel KSZ8041 driver binds instead and the
link is the same. So that is the symbol to add to
{atari,multi}_defconfig if you want the dedicated driver rather than
the fallback.

-- 
http://mikro.atari.org
