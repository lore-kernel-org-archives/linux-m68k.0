Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F35B2320CD1
	for <linux-m68k@lists.linux-m68k.org>; Sat,  5 Sep 2026 15:22:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788621759; cv=none; b=SjkLYosDnuU1s6WxRgCMQYCI+AovZOL8eDSO3xvyJxoIT1MugQYWzRbaT9P0VQ4H9crK+Q/QUjdBxVsl1RdBeHQ20QsXtNJpu8nD2PIeckPed2zUO2PI0SvgG6LWz7tJFlRgObtPX1MG+fFuFG8wvKk+mAw+EkrSiNV0XXO+tLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788621759; c=relaxed/simple;
	bh=stE75XH+VoyliaLEVzRsIQuDTfaIfORb7fDDrzhIzIw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X8sBAP4zWvxG7UYVMK+M3JI4v1YUMTfFe8SIxYib8sfeJBDzOP72UHTxCLXyiwKxh59ZtBzJ15mERyxUUCS1KJLUqPJCGSl4/m2XgQcnzijRP86g63mBeaZI3D8raqwHKCQTjJ0Avdgu8R1C8pfRl+S41OUMOigoS/c7C5Ff4Zk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Dz7r/V3p; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Dz7r/V3p"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-49b0eab380eso18035415e9.0
        for <linux-m68k@lists.linux-m68k.org>; Sat, 05 Sep 2026 08:22:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788621756; x=1789226556; darn=lists.linux-m68k.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xiwfJ3u464HVWwKQuOirA1XlcYzmmwiUzq3bDqr5FyA=;
        b=Dz7r/V3p+CfHFIFwIehfh3f7Vy7bOIEsviEArz9XiHEI//xknZENOjwAYPsgRf9puE
         xjqRiuSwW64LWeHCgyp7bOXMD1E0tmBQ/L2Aly69ItUfv6p6AcBClmU7fnpYAOd3eYBX
         VGkg8mYEyaTdgKLz1wE/ahF9JU7DxK1waLOuHk/WJDgWnzFCQlrQ66sQPIx+GcUmCiav
         4zbvv9A1YpG1Ur3VGfmyjRsh+Rg9Smtkjm0GFehZIzj6VDwWZ6XLm6avWvYK7njIlK8T
         w5poyzFVWV3dH6HfSLwHTSQ5Xn780GvdqMUY8IJMAFkG2EeGgtpMXKdfDS68RUV1s0S1
         WQrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788621756; x=1789226556;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xiwfJ3u464HVWwKQuOirA1XlcYzmmwiUzq3bDqr5FyA=;
        b=N/ktNVfaPDmcaAG8RFDfQIHKF7IT0/oyNCxmSVzFst+KcLBkRWxfgfgOkRAyv++sJ2
         hFRuq7P/0dVq6kyyXbZoounzOFh6Ty5CgOjm+476Ck78IqLUNycvyXfGMPM8fjwlkjHO
         6M8TQ7EsX4ihKKN7XC8onZ/EJahCpCzJm4Wr8+2bntYvYWSPAcNrzHt6G4IV8jKeXXwX
         Ps3p48wS9COJQLE8Oq4Ii148ksyYo8gM5igrQ3Ak1C4vcUxMB6qUuCZaWNrXzS1DlMoS
         0MmYjwkJQSXPYhkNHa0+1ts2+OghJdm/jnTlxHEG9N8LrQvNZXUnQ18Wtm5hffhrIwBe
         5njQ==
X-Forwarded-Encrypted: i=1; AKwUvByKiA4Nsi3w8zELUQCQen1UvqO948ekPTMfs1J7ABNZHW8iL2+az0OArrhW3BZdDDMQxaA9fFOonXpa@lists.linux-m68k.org
X-Gm-Message-State: AFuF++lJRPK5nxyIxgmeXvzPNz5waHqhHV8JNfUDo7cRH4ary752kwSU
	hK42Moa5Uw4uuL5C59ypXVW5iFCIMzSHpnlW+9Fw5cphCSKNTdEqs8I5
X-Gm-Gg: AYBFou0xBN/XcFeoxxAFYNoU1rx7ebxNRloMwTEahhaOrHJ1SdKeB6vIGjEjyK+ef+L
	e0j3bOfevE72JD0NeFkU6GANy9alAxlEPgB3F7Wrg7HI/Lz+FoZg2G7+e1Kg7KgK+17bBPVbFBD
	AHzm2fnmzuwcbyiTG4CBjKyfW343q+usW3bxqJzMu6bE0mTmqouO+PBuzDqh8Vokpk4lrTrUmBZ
	nj0vUW0R80nBLTya3AWTTGewtbyUrPooOv9umMielfqwrDOdX504KgtMN99SH3DkzZHqs/dF/Ju
	RI3TjdouZ/cksE5xz5hpme1HuE/xcYT9oNF/TdqtZWtKd8eS5DzeOvIVLUvw4mzMvK6f8EBiVQl
	ptRveijiCS6J15SDhZERjhz6i3oFPkRFWWho1serIjw0bVbPtsmCIryveFBaAQVCtsll9CzPXUo
	eI6CA3++6Hj/tLLAPBP6ljcEkpFTxAtYDE5YEdXmJBagCu1Zm/ExHf0SIYg+xVtFZHX3EY/IwHV
	d0FoYe/bmcpiwjNPIStDMNDXi1druB05z79w/qp9N7Tu6sdlzgrIi9bF8xxACmt2maeVTyMhHRU
	kW5pYEuYzF4d2P7yTHzKPa2+znExGDuDTcNPXnuKnHQhoVj0K4JMpewAkhfVBXMd
X-Received: by 2002:a05:600c:6303:b0:493:f783:c46a with SMTP id 5b1f17b1804b1-49cf82cbab5mr112017265e9.6.1788621756075;
        Sat, 05 Sep 2026 08:22:36 -0700 (PDT)
Received: from unknown748F3CBA5068 (dynamic-2a02-3100-a4eb-3001-c06d-af27-9fa2-ea53.310.pool.telefonica.de. [2a02:3100:a4eb:3001:c06d:af27:9fa2:ea53])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce5952560sm246185335e9.3.2026.09.05.08.22.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2026 08:22:35 -0700 (PDT)
Date: Sat, 5 Sep 2026 17:22:33 +0200
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Borislav Petkov <bp@alien8.de>
Cc: Jonathan Corbet <corbet@lwn.net>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, linux-m68k@lists.linux-m68k.org, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-input@vger.kernel.org, linux-doc@vger.kernel.org, 
	Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, 
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, Steve Wahl <steve.wahl@hpe.com>, 
	Dimitri Sivanich <dimitri.sivanich@hpe.com>, Mike Travis <mike.travis@hpe.com>, 
	Tony Luck <tony.luck@intel.com>, linux-edac@vger.kernel.org, 
	Krzysztof Kozlowski <krzk@kernel.org>, Arnd Bergmann <arnd@arndb.de>, linux-samsung-soc@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Tony Lindgren <tony@atomide.com>, 
	Kevin Hilman <khilman@baylibre.com>, linux-omap@vger.kernel.org, 
	Dominik Brodowski <linux@dominikbrodowski.net>, Damien Le Moal <dlemoal@kernel.org>, 
	Niklas Cassel <cassel@kernel.org>, linux-ide@vger.kernel.org, 
	Ethan Nelson-Moore <enelsonmoore@gmail.com>, Michael Schmitz <schmitzmic@gmail.com>, 
	Andreas Kemnade <andreas@kemnade.info>
Subject: Re: [PATCH v2 3/9] docs: kernel-parameters: Drop the edac_report=
 entry
Message-ID: <apwzmSr6b0WEkW86@gmail.com>
References: <20260905094649.41996-1-kmehltretter@gmail.com>
 <20260905094649.41996-4-kmehltretter@gmail.com>
 <20260905151345.GAapwxqT93wPWHF7u4@fat_crate.local>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260905151345.GAapwxqT93wPWHF7u4@fat_crate.local>

On Sat, Sep 05, 2026 at 08:13:45AM +0100, Borislav Petkov wrote:
> On Sat, Sep 05, 2026 at 11:46:43AM +0200, Karl Mehltretter wrote:
> > edac_report= went away with commit fee27d7d9788 ("EDAC: Delete
> > edac_stub.c"); nothing parses it any more.
> 
> Nope, it was:
> 
> 7fc0b9b995f2 ("EDAC: Drop the EDAC report status checks")
> 

Good catch! I will send a v3.

Thanks,
Karl
