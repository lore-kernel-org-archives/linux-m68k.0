Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81D56396B86
	for <linux-m68k@lists.linux-m68k.org>; Thu, 15 Jan 2026 12:24:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768479892; cv=none; b=ltJjWhu9FOMBg1gpjnm/5/tUhFou2x76MEdp1liypvs/tR61qv/0asqjV8I/olGWt7Oal3z4d057ZC2EIzdpQjrTcrqIldyxn+ZO0J/Cmd8aayzxOIp2CwR2SlyA674hAP2KUUvoyefRhe3wUAzxRvJ6y+iq31yKrNTeUxArnLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768479892; c=relaxed/simple;
	bh=L1TTyH0HQfm7i7n+eqeYhrSGiuwmELmvtw7QQ3GNH2Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h5KDSZEgGmcqXKEdUYKMcWRyC6OEEbJVGtLWpci+YLnH+en1s4J9zqd2ODz5LCqi/ZUfzRx31DVc3tOePMtmtStaub/7LLMVf4miHmaKZR4zI2dyuIz0LS0yo3VRTKYBaa/WXNxffrcWFmWBUbSi4c/welYx1+FcK7sxl76ibzw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=UqK/tSFN; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="UqK/tSFN"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-430f57cd471so530320f8f.0
        for <linux-m68k@lists.linux-m68k.org>; Thu, 15 Jan 2026 04:24:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1768479883; x=1769084683; darn=lists.linux-m68k.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=jS491F7pY/6VV44vwrzsFaAyA9RjAqjEAkamZCNInAE=;
        b=UqK/tSFN7QkjPd1b91uIkL/3v4JGUklcNc8S8KXMMit8mSHeUmW/SiSl4OidYlQdXS
         weKA+gvmsHQc/wPw4iZS2HMKXhhjmICoO2yhPyZgnRkoDDq8NpzXElscqWLt4h7w4dNB
         F7Gqbu9VeBUv8ZhdPvcV2B4zX3yVlSGTiWY3UdXKfl2n7ZkhS8vXk/L7NaUZj1mIaxt2
         aNGODvcgJG3XSVDFz0q4VkPLKacgIYaFvDMvvTu1IoDAIQCJ//RQvzBDoxWLsIr1I3Ud
         cWeENTevhyNPUht4bZkkz4Qy47MttryTlslFM9WFO6bSf/tli8Lc2biy0lI/0JxoQySX
         dQrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768479883; x=1769084683;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jS491F7pY/6VV44vwrzsFaAyA9RjAqjEAkamZCNInAE=;
        b=AdAawb60mP5ZRAdgyz+euZwu8jVzQABtYsA56uXMiQkt9Jb22XQHdr3GMD4kuGS/il
         NyeEvAqiXKcdsRf60XTsgH8zt6IOEXSqtL6JJ5X/3mNe1lQl+fe4kDiPNsSanqpuS1vQ
         cOEy8p+VaJrh70iPzPQ55fMP+w8jniFnpECiQFmRLLFS7Xto6me+xdAQ1MRKRDiVOeyH
         +Dl7wwRinQIQbeYssrpk9Z20l+83bUh7e+haGW1IaVqNfhPBF22rSGoBcXttGBRwHtTi
         +KYzsJv+ZQosLUkdco5NUQXcCszVCxgPAWTEl4QRckpcu+PFyT9uU0pCBCnvTNxWVWCL
         TKrg==
X-Forwarded-Encrypted: i=1; AJvYcCV3XFIhUhDZwBah+NwqvKaM8ESJC7FxVx+zpWH+6IODnf0MiFD/KOvQm2UHhtrfFUyH10jpKuSpqCbt@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YyjVu5LkTji8MZmjg2EgK4/S3h9MAnTqd9PfMcgeA63zdfd+CLm
	VdcRXdVuAvFhV1UtRJDrDdLJ+ZUtWgC7GRbLBw63SmEALRfDXFGiXDvAVXvxDBS3kYA=
X-Gm-Gg: AY/fxX441kmvQm5r2tppL5WEViyHa/hDflurQcMnlnThDXgGntkQz5pNHdd8MLAC+vh
	qGE6L7Vf+mQKGARPG9fb+1riBlFohOxHQSMw3S1PazXBnvlJfTYtnfDtBmrBf/YhdJZzyfpm0e2
	0YyaFRBRzQbRAa1cslNIg8Z6XZw8D2RSZWNhJYgiR7ZNajj+dtfn7S2Ngdz1quhaiz+UDTWAzdt
	0/0rlyT9jeE0BRvCrGlQt/aVSN9m0jMvJ403rxwqwG5tlB738Jj26zlBaPizMgHFQfRvus5PxtB
	dOEtmx4G/F1cI3wy4d5fmImuk01eYn6YM8ZBRNzkjO1Ww9gQNntm5x5TrNuLtrcbjjWsaBqVH+8
	+l2eoB+xz6N/HQ7UtFJLtPXje1IhwQOCfIiMys484olL5hfMbJORKhHa6BDVl2uwtAylE1kgtwR
	dGqtXYUEoRjuY9tQ==
X-Received: by 2002:a05:6000:1789:b0:432:5c43:64 with SMTP id ffacd0b85a97d-4342c547aa9mr7495008f8f.41.1768479882771;
        Thu, 15 Jan 2026 04:24:42 -0800 (PST)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-434af64a650sm5653238f8f.4.2026.01.15.04.24.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jan 2026 04:24:42 -0800 (PST)
Date: Thu, 15 Jan 2026 13:24:39 +0100
From: Petr Mladek <pmladek@suse.com>
To: Marcos Paulo de Souza <mpdesouza@suse.com>
Cc: Richard Weinberger <richard@nod.at>,
	Anton Ivanov <anton.ivanov@cambridgegreys.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jason Wessel <jason.wessel@windriver.com>,
	Daniel Thompson <danielt@kernel.org>,
	Douglas Anderson <dianders@chromium.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	John Ogness <john.ogness@linutronix.de>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Jiri Slaby <jirislaby@kernel.org>, Breno Leitao <leitao@debian.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>,
	"Guilherme G. Piccoli" <gpiccoli@igalia.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Andreas Larsson <andreas@gaisler.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jacky Huang <ychuang3@nuvoton.com>,
	Shan-Chun Hung <schung@nuvoton.com>, linux-um@lists.infradead.org,
	linux-kernel@vger.kernel.org, kgdb-bugreport@lists.sourceforge.net,
	linux-serial@vger.kernel.org, netdev@vger.kernel.org,
	linux-m68k@lists.linux-m68k.org, linux-hardening@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, sparclinux@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-fsdevel@vger.kernel.org
Subject: Re: [PATCH 13/19] um: drivers: mconsole_kern.c: Migrate to
 register_console_force helper
Message-ID: <aWjch-EcYm7tkF0t@pathway.suse.cz>
References: <20251227-printk-cleanup-part3-v1-0-21a291bcf197@suse.com>
 <20251227-printk-cleanup-part3-v1-13-21a291bcf197@suse.com>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251227-printk-cleanup-part3-v1-13-21a291bcf197@suse.com>

On Sat 2025-12-27 09:16:20, Marcos Paulo de Souza wrote:
> The register_console_force function was introduced to register consoles
> even on the presence of default consoles, replacing the CON_ENABLE flag
> that was forcing the same behavior.
> 
> No functional changes.
> 
> Signed-off-by: Marcos Paulo de Souza <mpdesouza@suse.com>

LGTM, nice cleanup!

Reviewed-by: Petr Mladek <pmladek@suse.com>

Best Regards,
Petr
