Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9551416109
	for <linux-m68k@lists.linux-m68k.org>; Mon,  6 Jul 2026 15:46:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783352809; cv=pass; b=Id3PsHy/3PtuMIFotnJzPYv/ReQQtFAJQg+pDsN+jv30bpN6htDuOPPyFAql5vHWRQstYi7Y9x30xFylcQkN4SigEtBRFpNJtBzlnhpOX6FKeCZwGrtEO3i7txboDEKI/hnAGrbK9P/AhOn9yygjYfqYMjcZXKDjbaOT1aCX7DM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783352809; c=relaxed/simple;
	bh=OT763+765AL37S5BJLMMQbirCxNjzAlqlQVzlwCI4Ns=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AyS3t5UGdVoKSJG7nfrIphI9Ko4RmGKmFJ9TC/wLT6AZaglftzff8O95XGC0r8F21OwRat9TRLswp5u99tAqGsdH928VtPRn7SUg8zUbsbqGUgnBoU/VQHdYpnOHqeOJiVFSHzH64Lac2Hk0SD2M2J8fiRT8PH+GpF6HS99VxBQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZOlsPwHz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZE/1EUMc; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZOlsPwHz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZE/1EUMc"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666FF30n981455
	for <linux-m68k@lists.linux-m68k.org>; Mon, 6 Jul 2026 15:46:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	F1tL7ezKmgwPKPnJpdHXHHXoZTxCOuZrev6KT6hfwTk=; b=ZOlsPwHzz3/nLKmD
	mSazt2nRu9GtZ0+YjI7Krw93S8LOBlHU4p3rkx/C2yIXPJIgBIRFTlox35JOlumq
	ltVC9qqV2Nkf0VAvnssny5+1VQXgVZo0yAtbFxWwxyJ0ztuyo5bmRLPlcgKNTPi7
	RuFInMYyg3oAoXgywhKVuuF9IZJJHpv+5m4JLyaG8AyhOP+2+Bnxhy5fBoNHHt59
	XlzxeDfgZ3b0/h/9/LqVm+fcQsfZH+MRJpOlS/QdAUGjlsxbKmIMzDannw7pW6cL
	Ao5y2uvUQDeowET76q2qeK8zaXxcs3ON1S0y9FnWgr0Lf7RkvxRUbpzXNnR5I6jI
	6M8kfw==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f89kgsr1n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-m68k@lists.linux-m68k.org>; Mon, 06 Jul 2026 15:46:44 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8fc92c5373bso5156336d6.1
        for <linux-m68k@lists.linux-m68k.org>; Mon, 06 Jul 2026 08:46:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783352804; cv=none;
        d=google.com; s=arc-20260327;
        b=jTU+EnFvrhrt+KWEtbwvoC+b8otiTvyBxv4UjNZC1JrXUkJCfdwuXo611ChcYdoDbx
         nh0+XFAhYRsyy8t/SoqYLBF1A+OR2YWO8EtrFnqDs+eElYcXROgk3YOmO3UoDO7SxdaL
         2e1I0PRy54oTCE/sN/VxNzWt9Yj+8W6t4v+1eyUnUOq+b1wwSn1z1rCDdMSFcNc1r1sS
         VVjyVu1JX1/fcm6q5wpEXgNTLiAnZ19PSqag/la3G30gCJyIK2JM/Hcj+HqDwfgEEvPr
         Hvgnx/76CFcP5kM2cAXO1qVHYubaJD87Dlajm+gguRAkvFi/DSChvHgdWlgm04F0JkuE
         9PgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=F1tL7ezKmgwPKPnJpdHXHHXoZTxCOuZrev6KT6hfwTk=;
        fh=QLcNAmFqoQDK4/vNYu2Mn/QyYkmay22ec2+KOkFF1ow=;
        b=DPnBinCT4BW/2jY8vI6ponuN31OocGqW+PxraH/f/HunvYj0EbI1iZiLY2ipTg8X8U
         UC3au92UbNAZO703ZKlgmVxTutc8I9trcUXHhSZ2HGuy5SrnKAplpOrHzUWjh07ddD0L
         KqoCC0yv+imNsCFf4k0Nl8DEfxTvDWcsHsDTlIm0jli9G7sCeoZOZPiANoysJuJry2LU
         UmmIP4tcoC5AwnCsgqztFG+aANy5hTzEXuy6Y8vn8eDOr/ueg4gufo2gudWL0ZnjuGI+
         CFkYObJ6kbGvDPgXJuZhq8MwTLzyMaLBdZPlYodnneE1Ps2EnmW4z1fDA/kFNRvx0EmA
         vTYQ==;
        darn=lists.linux-m68k.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783352804; x=1783957604; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F1tL7ezKmgwPKPnJpdHXHHXoZTxCOuZrev6KT6hfwTk=;
        b=ZE/1EUMcaYLR4L39BQ3qxW2dY97efrhOgMAre9q5wx48JayzR2kAM0R3tH9FpmRchd
         LoY9r8wnKZEzkWFx8pfycsXX0i0dTjVnbbBmUKJFB8RzZehvjpwaORks1dBsJ9VhMfIY
         +KPAu3OR4IstHRKXmiEVPYjbb7IYdka4pjs2OPW2C4+n3S7NzBO1nFH5SBqc8Wk7Az8W
         2h/ucxNBjYd7SS86Mff5oAcEtGelFHA1lkdNxaJMvbwkLIygs75R03XZQQRC5mk7KIZn
         5/H7r18xXk343oQOmNG/ShsK3cy5Klj4wHkoyESNAsqFwDm3H5rBGBSHkZBp6FVA1SpK
         WhxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783352804; x=1783957604;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=F1tL7ezKmgwPKPnJpdHXHHXoZTxCOuZrev6KT6hfwTk=;
        b=MjlMM78o06+70GUGb7F3Ut2x8YraLyRGHZAsQt8bD73VxBkwzobu6WUGE+0FqICkav
         8TjFs/4eyf+sJHMBbuMiR+1qo5UzE1JU35ARIvI+f6ZuR563EWXb8J6L+ur4g/QO7pVA
         KoQqdB5WsR4Asm3O7zlvEgfUtt8BKR4nmCmumdwhvLWK3I/NlJjYdlhd3iQAJyGkCKzK
         fD5nuxJQE/TqiomS9cOYOAFveQaUQsKAKfrg+tfVD+7tvNI+Zcpsgqzpaegs8YN9Ag5m
         S6OJJfj/Cp3la2KwBG2cGu3x7g6OkGXzyJMF5OCxly64Lr39XwXuvljLYExclTH1c36X
         WWhg==
X-Gm-Message-State: AOJu0YwFwHnKO7YYsajF1TAFtfzK5+qVPnqksabmZunaH+fxYCFlTIqi
	9NCJABHP6jC7PrUSC89Rcx2fOSS+xQ2L7Woy8u9XBx0d9r6oDMM/FzF3LCXIO9OEKAvjslj2JVg
	JvxiuT9bkCwTni0zGwWuTtSMaYNmOaX3IXyxc6IMbZQ1RJereXSoGGx0GPa1aERsfPpjLdvRSie
	GeX0VGG2xGUL2IrQwKqHDyVBwUn/mLgX48gtXdLOcisTyLHg==
X-Gm-Gg: AfdE7cm2dyT/frQQkdvjlmM1mVvbthOgJgJZk5f7FN7j7hGC/O4NIW9es4q+gUirhQU
	1RwelzNn8sE1Ln+vHXjy44plEq98tynpNyG0KYwbwnRnNFJymHc6wj33DLmyLRlMnWn56VJaIj5
	JTzIR3BpfRBU4VAi4L7MeO/3VdAhm4AZG00GCe5neDLOVm0UuhGPJhUpSb2UkL5ABApxfb
X-Received: by 2002:ad4:4eac:0:b0:8ec:235c:7a66 with SMTP id 6a1803df08f44-8fcb4c00ee9mr13393886d6.27.1783352803857;
        Mon, 06 Jul 2026 08:46:43 -0700 (PDT)
X-Received: by 2002:ad4:4eac:0:b0:8ec:235c:7a66 with SMTP id
 6a1803df08f44-8fcb4c00ee9mr13393296d6.27.1783352803240; Mon, 06 Jul 2026
 08:46:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260609142139.1563360-1-gerg@linux-m68k.org> <20260609142139.1563360-5-gerg@linux-m68k.org>
In-Reply-To: <20260609142139.1563360-5-gerg@linux-m68k.org>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Mon, 6 Jul 2026 17:46:31 +0200
X-Gm-Features: AVVi8Cfdl1DNUQnUfsfYJ-HKaMqWUP8hicUf_E8fyBBfHMErHTWhOeyxDX2mfns
Message-ID: <CAPx+jO8YPs-B1AJA6ShZTNMapFhmQgS79h7EHL7ZWQ3rc4g+qA@mail.gmail.com>
Subject: Re: [PATCHv2 3/4] mmc: sdhci-esdhc-mcf: do not use readl()/writel()
 on ColdFire
To: Greg Ungerer <gerg@linux-m68k.org>
Cc: linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org,
        arnd@kernel.org, wei.fang@nxp.com, frank.li@nxp.com,
        shenwei.wang@nxp.com, imx@lists.linux.dev, netdev@vger.kernel.org,
        nico@fluxnic.net, adureghello@baylibre.com, ulfh@kernel.org,
        linux-mmc@vger.kernel.org, linux-can@vger.kernel.org,
        linux-spi@vger.kernel.org, olteanv@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: zSQdVOX_mDWWvkPsC8nIgrfqGKz58lER
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDE2MCBTYWx0ZWRfX18LDMWxFg/BO
 rJW7MfwIKOer9L/Cw2HdYSZ+vYfuXackeH1CFHTXMcxyU5Bak8j22+r2+u5wd8DYX80RHJmarWB
 XJnJ/7kEKNXQLqI1WCdbS714Tw2Vco3KamxcZvNsbsj22GSWQoOD+kHcHTeTa/DVzlxYx7ExpJA
 Fq2DMqdV4t9ctdbEiezCbvgKaQXIIMRL3tbL4RcdKrFd06EXBgbe4pdO4mtwbmT99HS8kW9vaS3
 WHWIK/akv9QYLxhQwBt5ZHffTToTk4yFBxnYz4aoTBT2+MO+GRuUogILagsxMaQ8U8mgO1LJY+n
 IIaOopQV+W4iDbXI6CnGW7T7uOgbs1nl0Fx0x0i+hUkyWiUmAj7ChI5qFjgoRy+jB8WI0HgvfWK
 6+6CFhggIxxQnm2uyFzp2/HLcjnO3jCGK3n/+lBj3MbX8O9vmEGc3IWR5xUGHnxKpkYN+buVfZQ
 +UI5e3HOYyoD6lCdcIQ==
X-Proofpoint-ORIG-GUID: zSQdVOX_mDWWvkPsC8nIgrfqGKz58lER
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDE2MCBTYWx0ZWRfX3jY7HX5C81j0
 9CDgjyfyL5LbRSjEvP/A4a+XH2NIEEJiwZaRvd3zvpr8twzDFqak0LFx3PUIf0zCrCVzya8h1Uy
 syAIlvKOeJ8j/h9obu2ZDt10zmV/DJY=
X-Authority-Analysis: v=2.4 cv=c6Sbhx9l c=1 sm=1 tr=0 ts=6a4bcde4 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yOCtJkima9RkubShWh1s:22 a=tBb2bbeoAAAA:8 a=IpJZQVW2AAAA:8
 a=GOXD6VkAu_hHpBIGSSQA:9 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
 a=Oj-tNtZlA1e06AYgeCfH:22 a=IawgGOuG5U0WyFbmm1f5:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_02,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 clxscore=1011
 adultscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607060160

On Tue, Jun 9, 2026 at 4:27=E2=80=AFPM Greg Ungerer <gerg@linux-m68k.org> w=
rote:
>
> The implementation of the readX() and writeX() family of IO access
> functions is non-standard on ColdFire platforms. They check the supplied
> IO address and will return either big or little endian results based on
> that check. This is non-standard, they are expected to always return
> little-endian byte ordered data. Unfortunately this behavior also means
> that ioreadX()/iowroteX() and their big-endian counter parts
> ioreadXbe()/iowriteXbe() are wrong. This is now in the process of being
> cleaned up and fixed.
>
> Change the use of the readX() and writeX() access functions in this drive=
r
> to use the recently defined specific ColdFire internal SoC hardware IO
> access functions mcf_read8()/mcf_read16()/mcf_read32() and
> mcf_write8()/mcf_write16()/mcf_write32().
>
> There is no functional change to the driver. Though it does have the
> effect of making the IO access slightly more efficient, since there is
> no longer a need to do the address check at every register access.
>
> Acked-by: Angelo Dureghello <adureghello@baylibre.com>
> Tested-by: Angelo Dureghello <adureghello@baylibre.com>
> Signed-off-by: Greg Ungerer <gerg@linux-m68k.org>

Applied for next, thanks!

Kind regards
Uffe


> ---
> v2: moved from RFC to PATCH
>
>  drivers/mmc/host/sdhci-esdhc-mcf.c | 24 ++++++++++++------------
>  1 file changed, 12 insertions(+), 12 deletions(-)
>
> diff --git a/drivers/mmc/host/sdhci-esdhc-mcf.c b/drivers/mmc/host/sdhci-=
esdhc-mcf.c
> index 375fce5639d7..6853521e8b2c 100644
> --- a/drivers/mmc/host/sdhci-esdhc-mcf.c
> +++ b/drivers/mmc/host/sdhci-esdhc-mcf.c
> @@ -55,7 +55,7 @@ static inline void esdhc_clrset_be(struct sdhci_host *h=
ost,
>         if (reg =3D=3D SDHCI_HOST_CONTROL)
>                 val |=3D ESDHC_PROCTL_D3CD;
>
> -       writel((readl(base) & ~mask) | val, base);
> +       mcf_write32((mcf_read32(base) & ~mask) | val, base);
>  }
>
>  /*
> @@ -71,7 +71,7 @@ static void esdhc_mcf_writeb_be(struct sdhci_host *host=
, u8 val, int reg)
>         if (reg =3D=3D SDHCI_HOST_CONTROL) {
>                 u32 host_ctrl =3D ESDHC_DEFAULT_HOST_CONTROL;
>                 u8 dma_bits =3D (val & SDHCI_CTRL_DMA_MASK) >> 3;
> -               u8 tmp =3D readb(host->ioaddr + SDHCI_HOST_CONTROL + 1);
> +               u8 tmp =3D mcf_read8(host->ioaddr + SDHCI_HOST_CONTROL + =
1);
>
>                 tmp &=3D ~0x03;
>                 tmp |=3D dma_bits;
> @@ -82,12 +82,12 @@ static void esdhc_mcf_writeb_be(struct sdhci_host *ho=
st, u8 val, int reg)
>                  */
>                 host_ctrl |=3D val;
>                 host_ctrl |=3D (dma_bits << 8);
> -               writel(host_ctrl, host->ioaddr + SDHCI_HOST_CONTROL);
> +               mcf_write32(host_ctrl, host->ioaddr + SDHCI_HOST_CONTROL)=
;
>
>                 return;
>         }
>
> -       writel((readl(base) & mask) | (val << shift), base);
> +       mcf_write32((mcf_read32(base) & mask) | (val << shift), base);
>  }
>
>  static void esdhc_mcf_writew_be(struct sdhci_host *host, u16 val, int re=
g)
> @@ -110,24 +110,24 @@ static void esdhc_mcf_writew_be(struct sdhci_host *=
host, u16 val, int reg)
>                  * As for the fsl driver,
>                  * we have to set the mode in a single write here.
>                  */
> -               writel(val << 16 | mcf_data->aside,
> +               mcf_write32(val << 16 | mcf_data->aside,
>                        host->ioaddr + SDHCI_TRANSFER_MODE);
>                 return;
>         }
>
> -       writel((readl(base) & mask) | (val << shift), base);
> +       mcf_write32((mcf_read32(base) & mask) | (val << shift), base);
>  }
>
>  static void esdhc_mcf_writel_be(struct sdhci_host *host, u32 val, int re=
g)
>  {
> -       writel(val, host->ioaddr + reg);
> +       mcf_write32(val, host->ioaddr + reg);
>  }
>
>  static u8 esdhc_mcf_readb_be(struct sdhci_host *host, int reg)
>  {
>         if (reg =3D=3D SDHCI_HOST_CONTROL) {
>                 u8 __iomem *base =3D host->ioaddr + (reg & ~3);
> -               u16 val =3D readw(base + 2);
> +               u16 val =3D mcf_read16(base + 2);
>                 u8 dma_bits =3D (val >> 5) & SDHCI_CTRL_DMA_MASK;
>                 u8 host_ctrl =3D val & 0xff;
>
> @@ -137,7 +137,7 @@ static u8 esdhc_mcf_readb_be(struct sdhci_host *host,=
 int reg)
>                 return host_ctrl;
>         }
>
> -       return readb(host->ioaddr + (reg ^ 0x3));
> +       return mcf_read8(host->ioaddr + (reg ^ 0x3));
>  }
>
>  static u16 esdhc_mcf_readw_be(struct sdhci_host *host, int reg)
> @@ -149,14 +149,14 @@ static u16 esdhc_mcf_readw_be(struct sdhci_host *ho=
st, int reg)
>         if (reg =3D=3D SDHCI_HOST_VERSION)
>                 reg -=3D 2;
>
> -       return readw(host->ioaddr + (reg ^ 0x2));
> +       return mcf_read16(host->ioaddr + (reg ^ 0x2));
>  }
>
>  static u32 esdhc_mcf_readl_be(struct sdhci_host *host, int reg)
>  {
>         u32 val;
>
> -       val =3D readl(host->ioaddr + reg);
> +       val =3D mcf_read32(host->ioaddr + reg);
>
>         /*
>          * RM (25.3.9) sd pin clock must never exceed 25Mhz.
> @@ -245,7 +245,7 @@ static void esdhc_mcf_pltfm_set_clock(struct sdhci_ho=
st *host,
>          * fvco =3D fsys * outdvi1 + 1
>          * fshdc =3D fvco / outdiv3 + 1
>          */
> -       temp =3D readl(pll_dr);
> +       temp =3D mcf_read32(pll_dr);
>         fsys =3D pltfm_host->clock;
>         fvco =3D fsys * ((temp & 0x1f) + 1);
>         fesdhc =3D fvco / (((temp >> 10) & 0x1f) + 1);
> --
> 2.54.0
>
