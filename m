Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AB852EBBB9
	for <linux-m68k@lists.linux-m68k.org>; Fri,  8 May 2026 08:40:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778229648; cv=none; b=SxR+tyeWWkJI3eXo8X/TmCpVHVgaB5IBYJqyP+xhVT3XOi+i1LQKuMhiVBFHdMEMmqvtZ+Mg2AnderrzmzZ6SVeyKHcdKeM4seV8rlDieHYaebquVj+dgBNGIodCvLLZdfGonl09Lk39gNHkKrNY/7lM271ad+9qSHSxAS2338I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778229648; c=relaxed/simple;
	bh=EYq2LaRS7/wE9O5fN1xxBdxqWDcVL5HSo4IraNzRrbY=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jdQYgRB5AkYzWhsSevd+kO1dmYF+dn88YIN9Knuf2kWvEt7ZDj9jtXj6F3KzDyt+D2mrDQS3zlKbtEkLhbf+xivheKZGOP0cVg2EMtW3qJ2TOuEvnZ9uz938o9wjhehVQJXWjy1dS8urJa3eWa6mv4KtUxh+LSDmjhtuMQ7fOCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mvdbax10; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mvdbax10"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-48d102471a4so17326565e9.2
        for <linux-m68k@lists.linux-m68k.org>; Fri, 08 May 2026 01:40:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778229645; x=1778834445; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MBrLMbZ1kBG0nwZ7F1fosUl/09LgLiME1ma02b9cG8I=;
        b=mvdbax10UeiOaOHSd3rKvKHP1ETmueCoQQIVRFnGcIg3S8t5QJSUlkysgnjPjd2Obv
         CRgSPC9XRV+lNt6g+jN8ujGUlG7ASs8jhoxodwQw35D58Rd/dswsIcxmGRSPX8++o4Oz
         /zHog8OnR9miQxOuEiFjktJ/yuz5EtaqU9PoJ0lRuWh4CrCU3+95xnH5p1xZ1pBUkxRM
         CFm7piUcTDQhT6Sy8i6ZIfJZiuBAhbBBJRTH+s4CvKErxQrKYWKuYfXHpgz3n1tLYPUx
         Riyr4vLvL+jkdH2ZoAF/txcgkUOERMD9UI0Itb8Gr2Hf2wcFr6+odCnpFftUejbwjcbq
         5Reg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778229645; x=1778834445;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MBrLMbZ1kBG0nwZ7F1fosUl/09LgLiME1ma02b9cG8I=;
        b=CnxaP7UZNtVRDZgdEN78/waZdMO6IAVatxxf0rMtalS3SuKF3V7IVduNZgrSf8XH+J
         jzfQzgAE0Xasuru+MysI7mJBCjSXLtsrIiaD9Sx4wTBN9ydFiOcNDictR9+iE9WBchiQ
         iifl2/ZrckvhUqBo24HTn+RhK1zzbPM6EUa0mFmWPm2mEFz3sXDkXMMAwR7KJpfdkUtr
         6DBQeHWp+LqyZK3v7nliKrX9QlrJp8NToTaLVU0vJe1ATz8meXThoQA1oo56KcVXOJAU
         HeoG6jP+fwYuKB4FM3zq1ZtIb37vVEdq6eXClhhnjMZUJmM4HKQy8Oax9yqVLo7ohJoj
         eNsw==
X-Forwarded-Encrypted: i=1; AFNElJ8tDVm2Oz7iVPZ3BNRTnZyqhTxW4fN8IAcEancW0enzgBi/2wrZ1LjnnplzeA5V8mAwy7JSfH+/lzRy@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YwKHS0YocI4003L6kp1hVya9QZxyp0UZiNp+UYkBGPoAhfgXVqo
	u7eup7ywDmtf/bOBK3TzBbPHJb0dKtCR0GbFlcmku/9wVBf6e9MMOmPVQA32xpro
X-Gm-Gg: AeBDiesWGUVUqVhPer0SrIVbJ2j/PkHgr0aKtZ8ktRNDkpleX667sq0HAHV3UTGNOLc
	CaEhrCxO+lgdk+/zOdGRANYfLGLq3t5VExlqLorROwCfkttJHvIq4HREwjj8GIzzF13udTzh6jq
	C4oQE4GiuOryV7L947GiAjrUtgNUjluL3+vMMAPCsvqv9rLdc1RAQQxOGv8rj+GFgBU6iCnHoN8
	tOL74I5Gq0N23HbJUIaPELJLa4EifwEEkO0WnxL/kCICKdm8dDHEo6NAhGbeOJwOAmDErsOwdM8
	JdsdETWy1nbNdFwVN3rZyEbY8nMXiFjNhZcE4KEvfuh1bM29CPv5ZIOdFTmz48yD8kCP7QbN4bR
	XxrKkxBVrpw8kkg8GAwizS8WmWvh6QFipxUpQro1XUdWBpfrvIMcC6rYMMw4N17LgmCy+Nj5Icf
	A1nigOoChOcUmC08Cc/C4PIh4Bkvzr8Z9t0sOV5OHXPz1cZ5RC747pz9q9XC2nmd77
X-Received: by 2002:a05:600c:4703:b0:488:936a:6220 with SMTP id 5b1f17b1804b1-48e676ac055mr25431025e9.21.1778229645361;
        Fri, 08 May 2026 01:40:45 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45491bae13csm2688386f8f.29.2026.05.08.01.40.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 01:40:45 -0700 (PDT)
Date: Fri, 8 May 2026 09:40:43 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Wei Fang <wei.fang@nxp.com>
Cc: Greg Ungerer <gerg@kernel.org>, "linux-m68k@lists.linux-m68k.org"
 <linux-m68k@lists.linux-m68k.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "arnd@kernel.org" <arnd@kernel.org>, Greg
 Ungerer <gerg@linux-m68k.org>, Frank Li <frank.li@nxp.com>, Shenwei Wang
 <shenwei.wang@nxp.com>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>
Subject: Re: [RFC 1/4] net: fec: do not use readl()/writel() for ColdFire
Message-ID: <20260508094043.20f5f3fc@pumpkin>
In-Reply-To: <DBBPR04MB750044F98B1E719AD9DBD93E883D2@DBBPR04MB7500.eurprd04.prod.outlook.com>
References: <20260506142644.3234270-2-gerg@kernel.org>
	<DBBPR04MB750044F98B1E719AD9DBD93E883D2@DBBPR04MB7500.eurprd04.prod.outlook.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 8 May 2026 02:46:38 +0000
Wei Fang <wei.fang@nxp.com> wrote:

> >  static void
> >  fec_stop(struct net_device *ndev)
> >  {
> >  	struct fec_enet_private *fep = netdev_priv(ndev);
> > -	u32 rmii_mode = readl(fep->hwp + FEC_R_CNTRL) & FEC_RCR_RMII;
> > +	u32 rmii_mode = fec_readl(fep->hwp + FEC_R_CNTRL) & FEC_RCR_RMII;  
> 
> This is not an issue, but since you changed this line, the new code should
> follow the "reverse xmas tree" style.

Looking rmii_mode isn't even used until much later in the function.
(and then not very often)
Much better to read it just before it is needed.

	David


> 
> See: https://elixir.bootlin.com/linux/v7.0.1/source/Documentation/process/maintainer-netdev.rst#L380
> 
> >  	u32 val;
> > 
> >  	/* We cannot expect a graceful transmit stop without link !!! */
> >  	if (fep->link) {
> > -		writel(1, fep->hwp + FEC_X_CNTRL); /* Graceful transmit stop */
> > +		fec_writel(1, fep->hwp + FEC_X_CNTRL); /* Graceful transmit stop */
> >  		udelay(10);
> > -		if (!(readl(fep->hwp + FEC_IEVENT) & FEC_ENET_GRA))
> > +		if (!(fec_readl(fep->hwp + FEC_IEVENT) & FEC_ENET_GRA))
> >  			netdev_err(ndev, "Graceful transmit stop did not complete!\n");
> >  	}
> >   
> 
> 

