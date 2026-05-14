Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4B863D812D
	for <linux-m68k@lists.linux-m68k.org>; Thu, 14 May 2026 07:15:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778742916; cv=none; b=RIrRE2k4+WfCiRrFf4S4v7KCx0cfJ7qiEAP/MQxirVp8hncv1+C43XKHRsv0YMMsKWdtySG82MUIj6KzTNBNrsRuUaJHVOLP6GKvjylPfOygpMvCQJQ5LdLszkoeQTvOOni/g14CggC3ny5F7o0Pxa7/GAh68U7yW9b6m2OOkvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778742916; c=relaxed/simple;
	bh=l+NFTLiwTFo0Y0mDMz8N3XAktp3gRZfqvr2Jmi+ta18=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dBRsF3dEJn6OlKhfzx3eCYXHZKv/vs7nfip1cGLQnwqabUGE1/9i3U/cp8AFonQ+jjNdzsTVS4gWnULvw2pAwRJcB2FccasCXCfPXKMgrqMXtMOacRY0B/Hrp4CTZiX7T0ocQszQbVXP1KRasGP2EKDsxcyg9e9Z4Nul9vbzpmU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b=lhc9gIAT; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b="lhc9gIAT"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-44b330c5cc6so5578301f8f.1
        for <linux-m68k@lists.linux-m68k.org>; Thu, 14 May 2026 00:15:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20251104.gappssmtp.com; s=20251104; t=1778742911; x=1779347711; darn=lists.linux-m68k.org;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cb1yUNLCTgn66O03RLwbPulTwZS1mMXYrlXUWjjfA8I=;
        b=lhc9gIATxdPgsRDWIeFYsH4y/ymxxaihKwEFNlUF5A+jZnF6sk369R8ajSmLY4WIYO
         bcq1cMqdWIgRN4yxbqJgM6Uz7MUYIhrkBTv9UlJsfjo9VqIq9/kYQkQCbMfC126fvXsY
         Ic47FK5ejyuHlEyUfeYV98BdLw2IMoQXV7/GqVgvuhfps38sVk5NmkYASWsUtWenluGV
         kZBiTIsWjhHFECx50DK8EZ3RlOc0gD69SUF29yRtZKgrcCSd8yFwsUaUG7tS6laC3VN2
         RjruHvQzXP2vvRr/evGR61OtgXG4aOfouENvLngR5+jO8//doQQdw0OWuqyRYZNzatsE
         WMsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778742911; x=1779347711;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cb1yUNLCTgn66O03RLwbPulTwZS1mMXYrlXUWjjfA8I=;
        b=a1fVL/aShrn47bqWa00fLK8ANw0xulZ4q5k7NxbYeNiCu5T4gBZj8UKB1bfBLg0q8t
         4of7sSHEypuvzvVvsi/jt34qyahv+K+TeKjJ7VxD0QbNFo46fNGyFZ3oz19Iq2Gpi1ID
         iTmQbBzOgdwfC1pdhC6wpS8Q/MobwtUFpKPhau2pFOuUPypJ7qyqgcd2P4HIzMoUNL62
         QcXsol3ufwGMNzp9wvWvapZYwJi+Oo761tT1FtPVW7tZvkMUkAeT868kmWf0ibRwrmIt
         hueaem7JuGQe7cRjcd9p6adRFbMUwaPZCmvq8H4cIYNMpvTCM1HwoA42pPRTaSIG8bjy
         WswA==
X-Forwarded-Encrypted: i=1; AFNElJ8bzaKgvMFV6PJZCawKy5H3Giwz16wShAVeqyUA/3XTNNckvEPK8MK0LxHINVQ0ZZDhoMPp1nwXtKDw@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YyW0MAZQZxIQuIpgnwgGJMutVEKLaOPKEK8kF9rlhOKbnRhJaVm
	TpJKT5dPAGnBQIuK3hsDhxYzJxaowtQ1eRADId69j91w01eBQRPFYRb8bSZFXQbO13o=
X-Gm-Gg: Acq92OFsTaJ9nENfxagvtBq7T8mD/KP8Am+mbdOpMfJ3lQdQVdvb0Cro3DY4kHcO0Qa
	n6WrznjdeLTJnutXyfSKQjK+ktzXrfsbwQia5smyQZ6geMLOIG2tA+WkVWbQfMGUMm6oimaygTo
	q2oH6prfNr0uWJZzAKsJLOzMwI+EYCTeDM4XGjP8wEWF3oID4eEPHxOhiQe+AjD2z+Fa1Ffz5qp
	wtLcy2HXYz0ZovKXgiIxaVrqcTGsaKskwsVYu8c4QcKsYprolnHlmPvQ1vzmstYGpUBn29Qk9YW
	uxxWga9uQLCro11p2uQmd0Kh8izTOOsEusW4YTSUbk97bskCFtUGRwhizL/he8qFHipNAYjZgn9
	HQTQw6A7ecant2/2GTqSRA9gw9T5tFPExLcnesa6gxZnxF5XbRORW/l0qW2MHNa0pZofqjD61wV
	EXWNF6Uy5AVkaRmjbgXGNOnw3GMQ==
X-Received: by 2002:a5d:588f:0:b0:44a:9b52:8891 with SMTP id ffacd0b85a97d-45c7814a552mr9697538f8f.11.1778742910811;
        Thu, 14 May 2026 00:15:10 -0700 (PDT)
Received: from archlinux ([2a07:7e81:7daa:0:62cf:84ff:feee:627])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45da15a666fsm4327136f8f.36.2026.05.14.00.15.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2026 00:15:10 -0700 (PDT)
Date: Thu, 14 May 2026 09:15:09 +0200
From: Angelo Dureghello <adureghello@baylibre.com>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Greg Ungerer <gerg@linux-m68k.org>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, Steven King <sfking@fdwdc.com>, Arnd Bergmann <arnd@arndb.de>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
	Nuno =?utf-8?B?U8Oh?= <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>, 
	Greg Ungerer <gerg@uclinux.org>, linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, linux-iio@vger.kernel.org
Subject: Re: [PATCH v2 08/11] m68k: stmark2: add mcf5441x DAC platform devices
Message-ID: <y4zg2d5zghoz3miqevutiin5swfnx5y2zew2zlv4jklxsyly5g@sxeyvth2tkrk>
Mail-Followup-To: Andy Shevchenko <andriy.shevchenko@intel.com>, 
	Greg Ungerer <gerg@linux-m68k.org>, Geert Uytterhoeven <geert@linux-m68k.org>, 
	Steven King <sfking@fdwdc.com>, Arnd Bergmann <arnd@arndb.de>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
	Nuno =?utf-8?B?U8Oh?= <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>, 
	Greg Ungerer <gerg@uclinux.org>, linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, linux-iio@vger.kernel.org
References: <20260513-wip-stmark2-dac-v2-0-fcdae50cf51a@baylibre.com>
 <20260513-wip-stmark2-dac-v2-8-fcdae50cf51a@baylibre.com>
 <agTcEECgJvBydhe2@ashevche-desk.local>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <agTcEECgJvBydhe2@ashevche-desk.local>

Hi Andy,

On 13.05.2026 23:16, Andy Shevchenko wrote:
> On Wed, May 13, 2026 at 11:14:32AM +0200, Angelo Dureghello wrote:
> 
> > Add mcf5441x DAC platform devices.
> 
> ...
> 
> > +static struct resource dac0_resource[] = {
> > +	DEFINE_RES_MEM(MCFDAC_BASE0, 0x100),
> > +};
> > +
> > +static struct platform_device dac0_device = {
> > +	.name = "mcf54415_dac",
> > +	.id = 0,
> > +	.num_resources = ARRAY_SIZE(dac0_resource),
> > +	.resource = dac0_resource,
> > +};
> 
> It can be
> 
> static struct resource dac0_resource = DEFINE_RES_MEM(MCFDAC_BASE0, 0x100);
> 
> static struct platform_device dac0_device = {
> 	.name = "mcf54415_dac",
> 	.id = 0,
> 	.num_resources = 1,
> 	.resource = &dac0_resource,
> };
> 
> ...
> 
> Same for the rest. But I haven't seen the followups and don't know if those
> structures are going to be expanded. The commit message doesn't say anything
> about that. So I assume my suggestion valid.
> 

no. They are not going to be expanded, anyway, is there a real gain
using an hardcoded 1 there ?

Would not reissue a v3 for this honestly.

> -- 
> With Best Regards,
> Andy Shevchenko
> 
> 

Regards,
angelo
