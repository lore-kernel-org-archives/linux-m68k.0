Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795721976;
	b=Oa2zY9PRCqjmbcHbQ5s5Kf7HT2v7ZRMF0ch+QV+OeEgWAoLVl3QQ1poecijoLvpqJ8NF
	 kPzZULb0tfzuW0d6sDCeJDBujT/psrMrz914lP0+U8crz6HwDFR6g0o6zTemTRpt5Mvim
	 P1G/VjBnJkveEgDTB02OyJsMJI6Mx6qJtMWSR3nYnqyplwpUXyJEhWZlxtvOX+4onAMLl
	 u/t1InmASJIP/yEtDRm36hLYKVyrCM6EjX2urrUNPnFjucLMMMqETkV/Xb4vRtXJB+NoE
	 AOC5d0Sg66ilPr/r2TGsr2kRcp4OQkcbF84K6Px8n6jv8Y3qPv4bZTYnrEv81YTppdg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795721976;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=1JyQHuNi3zirNTL3+DOhmQ/6X/ugkLPIWASz+EFn6GQ=;
	b=yc/9g0VhBcrgmmwYO5mPcx3UU/t0ASn+GkYk1KQyaZL7VmH7FwboyOOUwzsOvXF1nAzD
	 6bUfDxufLC4S6tzW6vAzVSsrez0pRCT4mUMl/QzqtS+ExCgU3GqijhTmhAfoH3KKc3r4y
	 JeTXECsxjSZHidF472pXkSyxZviTbImmkWpSJnY/HNiCT3029Ycwt2UbMwOztuHTp+slZ
	 RkbL74BoUXRD+pz1gknoTcnncx3SNZms9ozSTPjubh0j15gdFnm6cPk+eqN8SOQe/BiB2
	 mVSeQsINk/avnFuFpLkVn1vjvtD0uHPI7idJT73g4R3TVrlgbxQh2DBn5mBqe3JWdPw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="wehxO/2y";
	arc=none smtp.remote-ip=209.85.216.44
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BA17606A323
	for <linux-m68k@lists.linux-m68k.org>; Thu, 26 Nov 2026 19:39:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6BA17606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wehxO/2y
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-3b520f1604fso272233a91.2
        for <linux-m68k@lists.linux-m68k.org>; Thu, 26 Nov 2026 11:39:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795721976; x=1796326776; darn=lists.linux-m68k.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1JyQHuNi3zirNTL3+DOhmQ/6X/ugkLPIWASz+EFn6GQ=;
        b=wehxO/2yvhrX2eNjXjtIvqtf2yn7VtOmwgnRcEfi4TyAREpfN7rC/2PEjjtuOKeu9t
         udLL2+ht39drNfuN8oVezhL7W+0i5IIWjbwTwgFJ0KZ7W/1jnNjbP1+PwsvOyFtCjgm5
         7/Pkar+WKLa0mkx67fnT1K6KNc7PpZmL6xS71m06zfDKUwRDD5or5P6/Hti5G8dh4T8A
         fMX9HsAuo9sLBhMps3jVlyCxSyKVWKAPqvM7KqEPJXax7scS/25bOWGG38C7LI6eJ8Ft
         vKEjV3bqmYWqO1oPqtV3AzqozYOp4v7z4oXRRAgSvP08siI0/StFTm6CT2aAxKMG28D1
         PvZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795721976; x=1796326776;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1JyQHuNi3zirNTL3+DOhmQ/6X/ugkLPIWASz+EFn6GQ=;
        b=1wAPY82DyXrITPq6gdWT2jyDnxOADFtc4IxFFnuWaHLaaNwTfClqKcHgRP/BgdlXbS
         J9bFTqFcIM5khA2/RV57gfGRmevIqP0h5yEDQAM9Y5A846WA631pPTSjchbwgMImYBz0
         ozGK9X8INFeaGI4WXUFzMcnWWHCiiiH25vFVCQqjkkzfrop+ZZnS9mdlbC9u1w07kcD4
         06DeQ4ZnoM1zt3SPKxk815jb2sjbprB8pN4oa3aFM1usPYlHUO8mbelegBpEkPFJrNqH
         4dHhsJsSC+Rrd4uCFrliDRAtkAm2+LJcVz0M+YG3+XYjKP+UKL3ISgsqTk1mR7nxpg2F
         t51w==
X-Forwarded-Encrypted: i=1; AL+hErG48JbVibtN6ma4A/y+BvUXG9eGjtN4suijs9RrJQABIgSeXvXClRrNm4knil2BFTOmEdtxeusQDmJO@lists.linux-m68k.org
X-Gm-Message-State: APuU4Z+PBjYr/+nHxeGaex12Vko/1r9c2mEjvGNdKd6UVLEr1iQ1c+mb
	lJr5Ajlm0I5MtePYTsy3j1W7UAxDT2G68vhhPkpQnNC2M/1lpYbnfcfE
X-Gm-Gg: AZFdTZehnOrqtAtWhuHBQVVN7syxIl4xakLUwAzoBTI9i9baGxMX+09OqNwT1X4d7km
	qZnGo9LaimOp/58Ie6JdOc9ALiK0zPziHDSsYEU7gz3rM9pkCZfm6Yg7UOPBw18WB1A0y9sXSsX
	3CPCcjjX0khkQb8fAcTKPTn24ushp4Jnl5GH1pZ0Q5BatPwJ6+Ggnjisv1EPw4thD3xSDjxKxft
	Pe7OeTr28sTxzIaDM9iaXNlNU2I6znARFVVBki4kzkK0S3WzmE5K+Cu4ex5lnGjPKFflILga5uB
	Zo/oz78Pgvj/kgnNNrtHQICJNBpqZi6M7c9xNstAhhGJLQMIYKXMAJiBDAF5LcV53Rs8WUC7foZ
	TsXcf28dYzjlsizqrCu9Lx1jGYy2q9yOTUPPdkPLW2OAQ0gdrlzwuMGBrqRe6crJ4sHilTbdy24
	skc6WC1tWWazPF5zeuB4AT2l2OtRNuZMvnBy9ZrYC6jSKhICyefW4UWcRkKFaZKRtALVs4GsTFe
	kzKmO/cgK7hEaYrt1sCGbmUHikLdmO2QD1kCv9Qq8PRWVgEuCtx1aNnfgAToysxCGINKdWx0vn8
	KIHaXG4aMEFEBajigltAMpDzSB+Ksw==
X-Received: by 2002:a17:90b:2701:b0:3b4:1bf1:9873 with SMTP id 98e67ed59e1d1-3b41c8dd1b8mr20338360a91.19.1795721975723;
        Thu, 26 Nov 2026 11:39:35 -0800 (PST)
Received: from google.com ([118.150.148.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b53479b149sm37761a91.6.2026.11.26.11.39.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 11:39:34 -0800 (PST)
Date: Fri, 27 Nov 2026 03:39:27 +0800
From: Kuan-Wei Chiu <visitorckw@gmail.com>
To: bot+bpf-ci@kernel.org
Cc: corbet@lwn.net, geert@linux-m68k.org, ast@kernel.org,
	daniel@iogearbox.net, andrii@kernel.org, eddyz87@gmail.com,
	memxor@gmail.com, gerg@linux-m68k.org, skhan@linuxfoundation.org,
	rdunlap@infradead.org, martin.lau@linux.dev, song@kernel.org,
	yonghong.song@linux.dev, jolsa@kernel.org, emil@etsalapatis.com,
	ihor.solodrai@linux.dev, marscheng@google.com, eleanor15x@gmail.com,
	jserv@ccns.ncku.edu.tw, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
	bpf@vger.kernel.org, daniel@thingy.jp, martin.lau@kernel.org,
	mason@kernel.org
Subject: Re: [PATCH v12] m68k, bpf: Add initial BPF JIT compiler support
Message-ID: <awiK1SMNCNxNipjQ@google.com>
References: <20261126170538.3471057-1-visitorckw@gmail.com>
 <0eb06d3a00f2e4d56c2f25db16eb8b02160387281fe455b0e0e5d7466492657e@mail.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Post: <mailto:linux-m68k@vger.kernel.org>
List-Help: <mailto:linux-m68k+help@vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-m68k+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0eb06d3a00f2e4d56c2f25db16eb8b02160387281fe455b0e0e5d7466492657e@mail.kernel.org>

On Thu, Nov 26, 2026 at 05:45:05PM +0000, bot+bpf-ci@kernel.org wrote:
> > m68k, bpf: Add initial BPF JIT compiler support
> 
> TL;DR: Nits only, no bug found: the m68k JIT hardcodes the tail-call limit
> (0x7021) and the 44/48-byte prologue jump offset; suggests named constants and
> a check so later edits don't quietly break tail calls.

I'll hold off on respinning just for these nits and fold them in if a
v13 is needed.

Regards,
Kuan-Wei
