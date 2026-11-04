Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793816491;
	b=YdgW1vS6UY8/QkGKCU8esjIK04aG9FSy/N7oDCIlLgqP8Rz2/MXI1VPBCbDNIBdn1L6g
	 ZktXUudO7HNKOkoR1umSNIzr5fMf8/GR6MlBFfSque3aEAOulO4x4ZDhQU/aCJTXBtcvj
	 h7A/NP5PuGCF8gbAXU/KsgxgADRqdJHz6aL8Bkm0JSVWwkcEvyf/DUWeL/bWayTSIOj6s
	 Tdj8zWxkHow4la904+vr1h48Krf0TZ2JWlFnWd4lKI6lXGym45yKbecYURqbXLjX7iNZl
	 bvonHVQH/jke3b24SrynwH1igiwvj+PS/d69eN+BTmLRCD9Tia+9pbRuq6nYb9R8b2w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793816491;
	h=DMARC-Filter:Received:Received:DKIM-Signature:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=JePMCfKku9pEUDTHsAhZnlP/cQPhOTSidIJ9IlFtxng=;
	b=Gu0i45TMIuJFrpgGEFXmUpwSi6mO7HSi0wqiJTzrYHxP7nE/ypQw5wsKOztrCmLftDEq
	 UbVdUzd6otKbu/qec+oSoaJa93frXz9a1Q33VfJBB0hoRcm/xUOtrHbRUEXIQ4gJf7eUq
	 xlydH5tGi6HwrMY7s/gplXm4TZ8eYFHyOdPiNdZ61TAbAVgig9RG6dnt6a4IUTm4X61oJ
	 JnMms0Ve0K3JRiJPBZ08AzivwyaUaKMYA6fWTsVQJUohzH7QAQFeRy5UF2DZ4mixhQmMg
	 g8nFQqOIx5tGvhxayEGOR2kjPtBf2iHnO1oCwtGL3Qp+yYzyyQi2SYxVYF3KHHHRVDA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kernel.org;
	spf=pass smtp.mailfrom=kernel.org;
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oEqSqtuf;
	arc=none smtp.remote-ip=172.105.4.254
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67C38606D833
	for <linux-m68k@lists.linux-m68k.org>; Wed,  4 Nov 2026 18:21:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 67C38606D833
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oEqSqtuf
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id B0C7D60A9B;
	Wed,  4 Nov 2026 18:21:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72B831F0180E;
	Wed,  4 Nov 2026 18:21:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793816490;
	bh=JePMCfKku9pEUDTHsAhZnlP/cQPhOTSidIJ9IlFtxng=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=oEqSqtuf3dQOGOF8fH7u936/F2G7Cgctm+FulpT4YWeG09bwZMpVbHKheBVML2qCg
	 CivgxtItI//tYy8SEMWoJz13mF7ZxJHSJaxvF7x6p8g3eRk2rIy6D+URLkeRCQnNkR
	 KNkIvppr4B6Y6UoYda6BbXkVlBDgmKM4EgJ7M5RTQGKCoUmHvoiHF2vFE5vee/JZTM
	 3PTMNnOt6qNHDgCFQ7Zr3oUtwP+PAcE/N1arv3UrAqW+sZbVQNEdj3pvZVZlatjjIX
	 8ExZfQDbyCr4pqUuyYfLvjjIQ5Gfi/wktxj6IxLJJFj9xR/XVZ3Xm4nHywmI0Z0K5v
	 puqwUOgEprupA==
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Date: Wed, 04 Nov 2026 18:20:24 +0000
Subject: [PATCH v5 06/11] objtool: do not hash DWARF relocations
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Post: <mailto:linux-m68k@vger.kernel.org>
List-Help: <mailto:linux-m68k+help@vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-m68k+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261104-build-speedup-v5-6-0f6018be8dae@kernel.org>
References: <20261104-build-speedup-v5-0-0f6018be8dae@kernel.org>
In-Reply-To: <20261104-build-speedup-v5-0-0f6018be8dae@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>, 
 Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
 Nick Desaulniers <ndesaulniers@google.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 Geert Uytterhoeven <geert@linux-m68k.org>, 
 Luis Chamberlain <mcgrof@kernel.org>, Petr Pavlu <petr.pavlu@suse.com>, 
 Daniel Gomez <da.gomez@kernel.org>, Sami Tolvanen <samitolvanen@google.com>, 
 Aaron Tomlin <atomlin@atomlin.com>, Josh Poimboeuf <jpoimboe@kernel.org>, 
 Peter Zijlstra <peterz@infradead.org>, Miguel Ojeda <ojeda@kernel.org>, 
 Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Tamir Duberstein <tamird@kernel.org>, 
 Alexandre Courbot <acourbot@nvidia.com>, 
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>
Cc: ljs@kernel.org, linux-kbuild@vger.kernel.org, 
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
 linux-m68k@lists.linux-m68k.org, linux-modules@vger.kernel.org, 
 rust-for-linux@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3375; i=ljs@kernel.org;
 h=from:subject:message-id; bh=aMXclC3dToXuPw8amRZ/vPdHrAbL7HmKgomYoAoiYOU=;
 b=owGbwMvMwCV2fu7ZrsZH9SKMp9WSGLJel+fKZkToeSc89FulWqB6tlet4LVrj7hVydopnVH+b
 +OmfLfvKGVhEONikBVTZHn+RXx/kEjYvM4L/m4wc1iZQIYwcHEKwETYpBj+adX5apU++huh8eDQ
 idrntcIa/cu3vHJkNNJsz3c5Ocv7GMP/QMe9nRIMtzVqfX6XnSuI5wtkNp++UMq5sm6vqNjZzIv
 cAA==
X-Developer-Key: i=ljs@kernel.org; a=openpgp;
 fpr=E7F417BF5214569E89D04F46CF9DCD8A81E27F14

objtool hashes the relocation of each section so it can find them by
destination, but DWARF sections are never looked up this way, so there is
no reason to hash them.

With CONFIG_DEBUG_INFO_DWARF5 set a defconfig vmlinux.o has ~22 million
relocations, 20.5 million of which are .debug_* sections.

Therefore, don't hash these.

With the same configuration the objtool vmlinux.o link-time run takes ~.5s
less to complete (2.63s -> 2.14s) and ~130 MiB memory to do it.

The output remains unchanged.

Signed-off-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
---
 tools/objtool/elf.c | 32 +++++++++++++++++++++++++-------
 1 file changed, 25 insertions(+), 7 deletions(-)

diff --git a/tools/objtool/elf.c b/tools/objtool/elf.c
index a791f4ea6ec1..98a110e3e8f5 100644
--- a/tools/objtool/elf.c
+++ b/tools/objtool/elf.c
@@ -1071,7 +1071,8 @@ struct reloc *elf_init_reloc(struct elf *elf, struct section *rsec,
 	set_reloc_type(elf, reloc, type);
 	set_reloc_addend(elf, reloc, addend);
 
-	elf_hash_add(reloc, &reloc->hash, reloc_hash(reloc));
+	if (!is_dwarf_section(rsec->base))
+		elf_hash_add(reloc, &reloc->hash, reloc_hash(reloc));
 	set_sym_next_reloc(reloc, sym->relocs);
 	sym->relocs = reloc;
 
@@ -1125,16 +1126,14 @@ struct reloc *elf_init_reloc_data_sym(struct elf *elf, struct section *sec,
 
 static int read_relocs(struct elf *elf)
 {
-	unsigned long nr_reloc, max_reloc = 0;
+	unsigned long nr_reloc, max_reloc = 0, nr_hashed = 0;
 	struct section *rsec;
 	struct reloc *reloc;
 	unsigned int symndx;
 	struct symbol *sym;
+	bool hashed;
 	int i;
 
-	if (!elf_alloc_hash(reloc, elf->num_relocs))
-		return -1;
-
 	list_for_each_entry(rsec, &elf->sections, list) {
 		if (!is_reloc_sec(rsec))
 			continue;
@@ -1147,6 +1146,23 @@ static int read_relocs(struct elf *elf)
 
 		rsec->base->rsec = rsec;
 
+		/*
+		 * DWARF relocations are never looked up by destination, they
+		 * only need to be on their symbol's list.
+		 */
+		if (!is_dwarf_section(rsec->base))
+			nr_hashed += sec_num_entries(rsec);
+	}
+
+	if (!elf_alloc_hash(reloc, nr_hashed))
+		return -1;
+
+	list_for_each_entry(rsec, &elf->sections, list) {
+		if (!is_reloc_sec(rsec))
+			continue;
+
+		hashed = !is_dwarf_section(rsec->base);
+
 		/* nr_alloc_relocs=0: libelf owns d_buf */
 		rsec->nr_alloc_relocs = 0;
 
@@ -1168,7 +1184,8 @@ static int read_relocs(struct elf *elf)
 				return -1;
 			}
 
-			elf_hash_add(reloc, &reloc->hash, reloc_hash(reloc));
+			if (hashed)
+				elf_hash_add(reloc, &reloc->hash, reloc_hash(reloc));
 			set_sym_next_reloc(reloc, sym->relocs);
 			sym->relocs = reloc;
 
@@ -1180,6 +1197,7 @@ static int read_relocs(struct elf *elf)
 	if (opts.stats) {
 		printf("max_reloc: %lu\n", max_reloc);
 		printf("num_relocs: %lu\n", elf->num_relocs);
+		printf("num_relocs_hashed: %lu\n", nr_hashed);
 		printf("reloc_bits: %d\n", elf->reloc_bits);
 	}
 
@@ -1634,7 +1652,7 @@ static int elf_alloc_reloc(struct elf *elf, struct section *rsec)
 
 	memcpy(new_relocs, old_relocs, nr_relocs_old * sizeof(struct reloc));
 
-	for (int i = 0; i < nr_relocs_old; i++) {
+	for (int i = 0; i < nr_relocs_old && !is_dwarf_section(rsec->base); i++) {
 		struct reloc *old = &old_relocs[i];
 		struct reloc *new = &new_relocs[i];
 		u32 key = reloc_hash(old);

-- 
2.56.0

