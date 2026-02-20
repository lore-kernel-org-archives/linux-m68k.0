Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com [209.85.221.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FA5733EAE7
	for <linux-m68k@lists.linux-m68k.org>; Fri, 20 Feb 2026 11:43:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771587839; cv=none; b=VXc5Yyzt1Eth3+vX0eqGKRxH9hczEYbHMvPL7pU6FNwWpJ7122S77NyfzNH8KBP71HkBlnJe7uUlflAxpcqslXhwbWDVjB545omj1q5HDKhKUg+uZBEm8JfdFsfiYf/RGOlyEtmNbkW1RCkXSSIp4k0kLx9fMqal0rSM4GnpXxA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771587839; c=relaxed/simple;
	bh=wBX6cnPwCpCSH4iNWjZA4c3kEfk5E/AuDIwwlVfhzyo=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=q2cJAfQJUJvgw8Y77yLWR7fNTiRdnhN1a9hsDpH2zGVu/tuq/iJplpVZEHPIzOHgOvHM1XEdSrGBX4pNkht9j2jkhSpRLMSkFUpDRKQ5Uzfhmg3uSZ6xxjpj/bfNfQqoEt0nbh87bmVUYgj+N3AGZX7M5xtMF4jWGyYN3R+0M5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=Ny4wDhUl; arc=none smtp.client-ip=209.85.221.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="Ny4wDhUl"
Received: by mail-wr1-f68.google.com with SMTP id ffacd0b85a97d-43638a3330dso1676808f8f.0
        for <linux-m68k@lists.linux-m68k.org>; Fri, 20 Feb 2026 03:43:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1771587835; x=1772192635; darn=lists.linux-m68k.org;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=wBX6cnPwCpCSH4iNWjZA4c3kEfk5E/AuDIwwlVfhzyo=;
        b=Ny4wDhUleRkjg0QXAHIXNr/VGk25EOp+6SMUvqMf1BwODtVz7DSzughAxn//3+yLZJ
         p1O0Vq3SPWHjIb2Tf8tvrNFpyzAdhgYAl/WTr44PxRWHJ/MI8kLmCcPb8r7G3VFcSBI5
         K82vkI/q5O2JsaR1K7dca33nQ8h+ASvR1w5NBMMnBlOkF/hL091TVXXQfUM6geHr/m23
         0GLq7Ct9W7gXhrULjCzK+vuJO8UOEHLKYOsoew9clsuDAS1naxqRXpCbL6yUVu5mGFCa
         +ZuK/LRuY2+I0wopWOhmHnpFHfS4Fnh6lSE0B9+tQKb59AZKPfhjLP6Ph8O/UYxF+1IB
         Q6ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771587835; x=1772192635;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wBX6cnPwCpCSH4iNWjZA4c3kEfk5E/AuDIwwlVfhzyo=;
        b=s2miECP/UJ7zux38pbdnUgEC4GsG2SjUhfB8t1avYMiQ3kUyO0915uHcZxWrGITgZr
         zbVo7i1o7ceKa+pRWocNtO1nIF20xY8JOs2wr68UCW10f5UU4eYoIizCVGgSCfrPYusa
         BbwF1SVyKjeIGYir7DcGUfh2uDBMU4D/0H4o9imxcDzwMhaWtLjJLX4B83Tz8jLVInjZ
         uw22ux0bHxy7d2JqcV3SJNqdQP+HIikK7ayQTzM5B8Jm5tLwThpwaxJivaqEi/yvZEO+
         goNxNFZ0vwO7HLQ8zm/CEtq7wieQ2qwRJ1RYhZesF0uyM22+MgYwrR1tC042F64HCut3
         JVug==
X-Forwarded-Encrypted: i=1; AJvYcCUcSXD61ztJs/ATsDj9G8KCqNoTavXLokFWwMOMThy5qrp6UYNcPWqBJOwZh01d5ugTl8N92Oms/J7h@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YzVbTnyYob/7eXXjMidxrNMBN/iylxr0/0Sj69q+iygEiYi5VDp
	Mg9HNeTHqz+9nh+/1D2xjn7FZjsg0Q7L6PQL0nrzaY0wiaHGEpRX2T3LbtZ7mUFbAag=
X-Gm-Gg: AZuq6aLnjdn0rbONyWQpL18K5Yk6i50H4jKktWMsa43e+jthIJKjiNVZI0ZKFwkcqJz
	nDbS6jVF3YWUqScnlZaApat02zaGsduQ9hBAdZt1ZxeYKn7wGSlLRJTLB7dlqcg5+QQYk/DlrRt
	kRHv1qS7BSvNNhf+DuNyi64OFzkVSdW7DIVWEluL8emzjITyL0dpws3Yvzco6rUE9vR0hU341PV
	Ojkj/7oH21vl2XwgOJ1z2JgmHE7rSyjElKbgHlBdySORBIENoZZ/3KvLkR1LRNQWvZUVLRwAu2S
	tuTIXzXAtX8EJto6dfhCRG8Ee4vRdft0EtnS10wZrj9azu192S8DNRwtlF/QEzXKH7zKfdQ5rb/
	gepb97lWPbjbTfXGYQKpLW928AbWC505hdYGvGtRrgsWUQ4V0NZuo4+xfG8qfkvtSUZ/2k58Jn5
	6VkQgFRLzZTaLkchXmasvamj0tTuoe3kZavgh0WIQhE3CgBFCACOmOZ4FLozPfEA==
X-Received: by 2002:a5d:5f93:0:b0:435:e060:8071 with SMTP id ffacd0b85a97d-4379db61767mr35206496f8f.16.1771587835206;
        Fri, 20 Feb 2026 03:43:55 -0800 (PST)
Received: from ?IPv6:2804:5078:822:3100:58f2:fc97:371f:2? ([2804:5078:822:3100:58f2:fc97:371f:2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43796a5d156sm60289350f8f.5.2026.02.20.03.43.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Feb 2026 03:43:54 -0800 (PST)
Message-ID: <f074138f16e49e9966512cce2c07724ae9a77975.camel@suse.com>
Subject: Re: [PATCH 00/19] printk cleanup - part 3
From: Marcos Paulo de Souza <mpdesouza@suse.com>
To: Richard Weinberger <richard@nod.at>, Anton Ivanov	
 <anton.ivanov@cambridgegreys.com>, Johannes Berg
 <johannes@sipsolutions.net>,  Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Jason Wessel <jason.wessel@windriver.com>,
 Daniel Thompson	 <danielt@kernel.org>, Douglas Anderson
 <dianders@chromium.org>, Petr Mladek	 <pmladek@suse.com>, Steven Rostedt
 <rostedt@goodmis.org>, John Ogness	 <john.ogness@linutronix.de>, Sergey
 Senozhatsky <senozhatsky@chromium.org>,  Jiri Slaby <jirislaby@kernel.org>,
 Breno Leitao <leitao@debian.org>, Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
 <pabeni@redhat.com>, Geert Uytterhoeven <geert@linux-m68k.org>, Kees Cook	
 <kees@kernel.org>, Tony Luck <tony.luck@intel.com>, "Guilherme G. Piccoli"	
 <gpiccoli@igalia.com>, Madhavan Srinivasan <maddy@linux.ibm.com>, Michael
 Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy	 <christophe.leroy@csgroup.eu>, Andreas Larsson
 <andreas@gaisler.com>,  Alexander Shishkin
 <alexander.shishkin@linux.intel.com>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Alexandre Torgue	
 <alexandre.torgue@foss.st.com>, Jacky Huang <ychuang3@nuvoton.com>, 
 Shan-Chun Hung <schung@nuvoton.com>, Laurentiu Tudor
 <laurentiu.tudor@nxp.com>
Cc: linux-um@lists.infradead.org, linux-kernel@vger.kernel.org, 
	kgdb-bugreport@lists.sourceforge.net, linux-serial@vger.kernel.org, 
	netdev@vger.kernel.org, linux-m68k@lists.linux-m68k.org, 
	linux-hardening@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	sparclinux@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-fsdevel@vger.kernel.org
Date: Fri, 20 Feb 2026 08:43:42 -0300
In-Reply-To: <20251227-printk-cleanup-part3-v1-0-21a291bcf197@suse.com>
References: <20251227-printk-cleanup-part3-v1-0-21a291bcf197@suse.com>
Autocrypt: addr=mpdesouza@suse.com; prefer-encrypt=mutual;
 keydata=mDMEZ/0YqhYJKwYBBAHaRw8BAQdA4JZz0FED+JD5eKlhkNyjDrp6lAGmgR3LPTduPYGPT
 Km0Kk1hcmNvcyBQYXVsbyBkZSBTb3V6YSA8bXBkZXNvdXphQHN1c2UuY29tPoiTBBMWCgA7FiEE2g
 gC66iLbhUsCBoBemssEuRpLLUFAmf9GKoCGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4AACgk
 QemssEuRpLLWGxwD/S1I0bjp462FlKb81DikrOfWbeJ0FOJP44eRzmn20HmEBALBZIMrfIH2dJ5eM
 GO8seNG8sYiP6JfRjl7Hyqca6YsE
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
User-Agent: Evolution 3.58.3 (by Flathub.org) 
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

T24gU2F0LCAyMDI1LTEyLTI3IGF0IDA5OjE2IC0wMzAwLCBNYXJjb3MgUGF1bG8gZGUgU291emEg
d3JvdGU6Cj4gVGhlIHBhcnRzIDEgYW5kIDIgY2FuIGJlIGZvdW5kIGhlcmUgWzFdIGFuZCBoZXJl
WzJdLgo+IAo+IFRoZSBjaGFuZ2VzIHByb3Bvc2VkIGluIHRoaXMgcGFydCAzIGFyZSBtb3N0bHkg
dG8gY2xhcmlmeSB0aGUgdXNhZ2UKPiBvZgo+IHRoZSBpbnRlcmZhY2VzIGZvciBOQkNPTiwgYW5k
IHVzZSB0aGUgcHJpbnRrIGhlbHBlcnMgbW9yZSBicm9hZGx5Lgo+IEJlc2lkZXMgaXQsIGl0IGFs
c28gaW50cm9kdWNlcyBhIG5ldyB3YXkgdG8gcmVnaXN0ZXIgY29uc29sZXMKPiBhbmQgZHJvcCB0
aGVzIHRoZSBDT05fRU5BQkxFRCBmbGFnLiBJdCBzZWVtcyB0b28gbXVjaCwgYnV0IGluIHJlYWxp
dHkKPiB0aGUgY2hhbmdlcyBhcmUgbm90IGNvbXBsZXgsIGFuZCBhcyB0aGUgdGl0bGUgc2F5cywg
aXQncyBiYXNpY2FsbHkgYQo+IGNsZWFudXAgd2l0aG91dCBjaGFuZ2luZyB0aGUgZnVuY3Rpb25h
bCBjaGFuZ2VzLgo+IAo+IFRoaXMgcGF0Y2hzZXQgaW5jbHVkZXMgYSBwYXRjaCBmcm9tIHBhcnQg
MiB0aGF0IG5lZWRlZCBtb3JlIHdvcmsgWzNdLAo+IGFzCj4gc3VnZ2VzdGVkIGJ5IFBldHIgTWxh
ZGVrLgo+IAo+IFRoZXNlIGNoYW5nZXMgd2VyZSB0ZXN0ZWQgYnkgcmV2ZXJ0aW5nIGY3OWIxNjNj
NDIzMQo+ICgiUmV2ZXJ0ICJzZXJpYWw6IDgyNTA6IFN3aXRjaCB0byBuYmNvbiBjb25zb2xlIiIp
LCBhbmQgdXNlZCBxZW11IHRvCj4gdGVzdAo+IHN1c3BlbmQvcmVzdW1lIGN5Y2xlcywgYW5kIGV2
ZXJ5dGhpbmcgd29ya2VkIGFzIGV4cGVjdGVkLgo+IAo+IFBTOiBiNCAtLWF1dG8tdG8tY2MgYWRk
ZWQgYSBidW5jaCBvZiBwZW9wbGUgYXMgQ0MsIHNvIEknbSBub3Qgc3VyZSBpZgo+IEkgc2hvdWxk
IHJlbW92ZSBzb21lIG9yIG5vdCwgc28gSSdtIGxlYXZpbmcgdGhlIGxpc3QgYXMgaXQgaXMuIElm
IHRoZQo+IHBhdGNoc2V0IG5lZWRzIGEgdjIsIGFuZCB5b3UgZmVlbCB0aGF0IHlvdSBkb24ndCBu
ZWVkIHRvIGNvcGllZCwganVzdAo+IGxldCBtZSBrbm93Lgo+IAo+IFRoYW5rcyBmb3IgY2hlY2tp
bmcgdGhlIHBhdGNoZXMsIGFuZCBoYXBweSBob2xpZGF5cyEKPiAKPiBbMV06Cj4gaHR0cHM6Ly9s
b3JlLmtlcm5lbC5vcmcvbGttbC8yMDI1MDIyNi1wcmludGstcmVuYW1pbmctdjEtMC0wYjg3ODU3
N2YyZTZAc3VzZS5jb20vI3QKPiBbMl06Cj4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgt
c2VyaWFsLzIwMjUxMTIxLXByaW50ay1jbGVhbnVwLXBhcnQyLXYyLTAtNTdiOGI3ODY0N2Y0QHN1
c2UuY29tLwo+IFszXToKPiBodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1zZXJpYWwvYVNn
ZXFNM0RXdlI4LWNNWUBwYXRod2F5LnN1c2UuY3ovCj4gCj4gU2lnbmVkLW9mZi1ieTogTWFyY29z
IFBhdWxvIGRlIFNvdXphIDxtcGRlc291emFAc3VzZS5jb20+Cj4gLS0tCj4gTWFyY29zIFBhdWxv
IGRlIFNvdXphICgxOSk6Cj4gwqDCoMKgwqDCoCBwcmludGsvbmJjb246IFVzZSBhbiBlbnVtIHRv
IHNwZWNpZnkgdGhlIHJlcXVpcmVkIGNhbGxiYWNrIGluCj4gY29uc29sZV9pc191c2FibGUoKQo+
IMKgwqDCoMKgwqAgcHJpbnRrOiBJbnRyb2R1Y2UgY29uc29sZV9pc19uYmNvbgo+IMKgwqDCoMKg
wqAgcHJpbnRrOiBEcm9wIGZsYWdzIGFyZ3VtZW50IGZyb20gY29uc29sZV9pc191c2FibGUKPiDC
oMKgwqDCoMKgIHByaW50azogUmVpbnRyb2R1Y2UgY29uc29sZXNfc3VzcGVuZGVkIGdsb2JhbCBz
dGF0ZQo+IMKgwqDCoMKgwqAgcHJpbnRrOiBBZGQgbW9yZSBjb250ZXh0IHRvIHN1c3BlbmQvcmVz
dW1lIGZ1bmN0aW9ucwo+IMKgwqDCoMKgwqAgcHJpbnRrOiBJbnRyb2R1Y2UgcmVnaXN0ZXJfY29u
c29sZV9mb3JjZQo+IMKgwqDCoMKgwqAgZHJpdmVyczogbmV0Y29uc29sZTogTWlncmF0ZSB0byBy
ZWdpc3Rlcl9jb25zb2xlX2ZvcmNlIGhlbHBlcgo+IMKgwqDCoMKgwqAgZGVidWc6IGRlYnVnX2Nv
cmU6IE1pZ3JhdGUgdG8gcmVnaXN0ZXJfY29uc29sZV9mb3JjZSBoZWxwZXIKPiDCoMKgwqDCoMKg
IG02OGs6IGVtdTogbmZjb24uYzogTWlncmF0ZSB0byByZWdpc3Rlcl9jb25zb2xlX2ZvcmNlIGhl
bHBlcgo+IMKgwqDCoMKgwqAgZnM6IHBzdG9yZTogcGxhdGZvcm06IE1pZ3JhdGUgdG8gcmVnaXN0
ZXJfY29uc29sZV9mb3JjZSBoZWxwZXIKPiDCoMKgwqDCoMKgIHBvd2VycGM6IGtlcm5lbDogdWRi
ZzogTWlncmF0ZSB0byByZWdpc3Rlcl9jb25zb2xlX2ZvcmNlIGhlbHBlcgo+IMKgwqDCoMKgwqAg
c3BhcmM6IGtlcm5lbDogYnRleHQ6IE1pZ3JhdGUgdG8gcmVnaXN0ZXJfY29uc29sZV9mb3JjZSBo
ZWxwZXIKPiDCoMKgwqDCoMKgIHVtOiBkcml2ZXJzOiBtY29uc29sZV9rZXJuLmM6IE1pZ3JhdGUg
dG8gcmVnaXN0ZXJfY29uc29sZV9mb3JjZQo+IGhlbHBlcgo+IMKgwqDCoMKgwqAgZHJpdmVyczog
aHd0cmFjaW5nOiBzdG06IGNvbnNvbGUuYzogTWlncmF0ZSB0bwo+IHJlZ2lzdGVyX2NvbnNvbGVf
Zm9yY2UgaGVscGVyCj4gwqDCoMKgwqDCoCBkcml2ZXJzOiB0dHk6IHNlcmlhbDogbXV4LmM6IE1p
Z3JhdGUgdG8gcmVnaXN0ZXJfY29uc29sZV9mb3JjZQo+IGhlbHBlcgo+IMKgwqDCoMKgwqAgZHJp
dmVyczogdHR5OiBzZXJpYWw6IG1hMzVkMV9zZXJpYWw6IE1pZ3JhdGUgdG8KPiByZWdpc3Rlcl9j
b25zb2xlX2ZvcmNlIGhlbHBlcgo+IMKgwqDCoMKgwqAgZHJpdmVyczogdHR5OiBlaHZfYnl0ZWNo
YW46IE1pZ3JhdGUgdG8gcmVnaXN0ZXJfY29uc29sZV9mb3JjZQo+IGhlbHBlcgo+IMKgwqDCoMKg
wqAgZHJpdmVyczogYnJhaWxsZTogY29uc29sZTogRHJvcCBDT05fRU5BQkxFRCBjb25zb2xlIGZs
YWcKPiDCoMKgwqDCoMKgIHByaW50azogUmVtb3ZlIENPTl9FTkFCTEVEIGZsYWcKPiAKPiDCoGFy
Y2gvbTY4ay9lbXUvbmZjb24uY8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgfMKgwqAgNSArLQo+IMKgYXJjaC9wb3dlcnBjL2tlcm5lbC91ZGJnLmPC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfMKgwqAgNCArLQo+IMKg
YXJjaC9zcGFyYy9rZXJuZWwvYnRleHQuY8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIHzCoMKgIDQgKy0KPiDCoGFyY2gvdW0vZHJpdmVycy9tY29uc29sZV9rZXJu
LmPCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8wqDCoCAzICstCj4gwqBhcmNoL3Vt
L2tlcm5lbC9rbXNnX2R1bXAuY8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCB8wqDCoCAyICstCj4gwqBkcml2ZXJzL2FjY2Vzc2liaWxpdHkvYnJhaWxsZS9icmFpbGxl
X2NvbnNvbGUuYyB8wqDCoCAxIC0KPiDCoGRyaXZlcnMvaHd0cmFjaW5nL3N0bS9jb25zb2xlLmPC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8wqDCoCA0ICstCj4gwqBkcml2ZXJzL25l
dC9uZXRjb25zb2xlLmPCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIHzCoCAxMyArLS0KPiDCoGRyaXZlcnMvdHR5L2Vodl9ieXRlY2hhbi5jwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzCoMKgIDQgKy0KPiDCoGRyaXZlcnMvdHR5
L3NlcmlhbC9tYTM1ZDFfc2VyaWFsLmPCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8wqDCoCA0
ICstCj4gwqBkcml2ZXJzL3R0eS9zZXJpYWwvbXV4LmPCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzCoMKgIDQgKy0KPiDCoGRyaXZlcnMvdHR5L3R0eV9pby5j
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzC
oMKgIDYgKy0KPiDCoGZzL3Byb2MvY29uc29sZXMuY8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfMKgwqAgMSAtCj4gwqBmcy9wc3RvcmUv
cGxhdGZvcm0uY8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCB8wqDCoCA2ICstCj4gwqBpbmNsdWRlL2xpbnV4L2NvbnNvbGUuaMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8IDE0Mwo+ICsrKysrKysrKysr
KysrKysrKystLS0tLQo+IMKga2VybmVsL2RlYnVnL2RlYnVnX2NvcmUuY8KgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzCoMKgIDYgKy0KPiDCoGtlcm5lbC9kZWJ1
Zy9rZGIva2RiX2lvLmPCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCB8wqDCoCA2ICstCj4gwqBrZXJuZWwvcHJpbnRrL25iY29uLmPCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzCoCAxNyArLS0KPiDCoGtlcm5lbC9w
cmludGsvcHJpbnRrLmPCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCB8IDE0MCArKysrKysrKysrKystLQo+IC0tLS0tLS0tLQo+IMKgMTkgZmlsZXMgY2hh
bmdlZCwgMjMwIGluc2VydGlvbnMoKyksIDE0MyBkZWxldGlvbnMoLSkKClRoaXMgcGF0Y2hzZXQs
IHdpdGhvdXQgdGhlIHJlY2VudCBjbGVhbnVwIGZyb20gUGV0ciBNbGFkZWsgWzFdLCBoYXMgYQpy
ZWdyZXNzaW9uLiBJJ2xsIHdhaXQgZm9yIGl0IHRvIGJlIG1lcmdlZCBmaXJzdCBiZWZvcmUgc2Vu
ZGluZyBhIG5ldwp2ZXJzaW9uIG9mIHRoaXMgcGF0Y2hzZXQuIFRoYW5rcyBmb3IgYWxsIHRoZSBy
ZXZpZXdzIQoKWzFdOgpodHRwczovL2xvcmUua2VybmVsLm9yZy9sa21sLzIwMjYwMjA2MTY1MDAy
LjQ5NjcyNC0xLXBtbGFkZWtAc3VzZS5jb20vCgo+IC0tLQo+IGJhc2UtY29tbWl0OiA5M2Q2NTU4
NzQ3OWNmYzk3YzBkN2U0MWI1ZThjNjM3OGNhNjgxNjMyCj4gY2hhbmdlLWlkOiAyMDI1MTIwMi1w
cmludGstY2xlYW51cC1wYXJ0My1lYTExNmIxMWIzYTYKPiAKPiBCZXN0IHJlZ2FyZHMsCj4gLS3C
oCAKPiBNYXJjb3MgUGF1bG8gZGUgU291emEgPG1wZGVzb3V6YUBzdXNlLmNvbT4K

