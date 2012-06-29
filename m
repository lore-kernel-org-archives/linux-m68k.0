From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 1/4] m68k: common PCI support definitions
	and code
Date: Fri, 29 Jun 2012 07:45:10 +0200
Message-ID: <CAMuHMdWn_R-fqFUpNQUiMAnw_NN_0-1L7PBm27z=ya2=JLVkeA@mail.gmail.com>
References: <1340947070-10672-1-git-send-email-gerg@snapgear.com>
 <1340947070-10672-2-git-send-email-gerg@snapgear.com>
Reply-To: uClinux development list <uclinux-dev@uclinux.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <uclinux-dev-bounces@uclinux.org>
In-Reply-To: <1340947070-10672-2-git-send-email-gerg@snapgear.com>
List-Unsubscribe: <http://mailman.uclinux.org/mailman/options/uclinux-dev>,
 <mailto:uclinux-dev-request@uclinux.org?subject=unsubscribe>
List-Archive: <http://mailman.uclinux.org/pipermail/uclinux-dev>
List-Post: <mailto:uclinux-dev@uclinux.org>
List-Help: <mailto:uclinux-dev-request@uclinux.org?subject=help>
List-Subscribe: <http://mailman.uclinux.org/mailman/listinfo/uclinux-dev>,
 <mailto:uclinux-dev-request@uclinux.org?subject=subscribe>
Errors-To: uclinux-dev-bounces@uclinux.org
Sender: uclinux-dev-bounces@uclinux.org
To: gerg@snapgear.com
Cc: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org, Greg Ungerer <gerg@uclinux.org>
List-Id: linux-m68k@vger.kernel.org

T24gRnJpLCBKdW4gMjksIDIwMTIgYXQgNzoxNyBBTSwgIDxnZXJnQHNuYXBnZWFyLmNvbT4gd3Jv
dGU6Cj4gQmFzaWMgc2V0IG9mIGRlZmluaXRpb25zIGFuZCBzdXBwb3J0IGNvZGUgcmVxdWlyZWQg
dG8gdHVybiBvbiBDT05GSUdfUENJCj4gZm9yIHRoZSBtNjhrIGFyY2hpdGVjdHVyZS4gTm90aGlu
ZyBzcGVjaWZpYyB0byBhbnkgUENJIGltcGxlbWVudGF0aW9uIGluCj4gYW55IG02OGsgY2xhc3Mg
Q1BVIGhhcndkYXJlIHlldC4KPgo+IFNpZ25lZC1vZmYtYnk6IEdyZWcgVW5nZXJlciA8Z2VyZ0B1
Y2xpbnV4Lm9yZz4KCk5vdGhpbmcgaGFybWZ1bCB0byB0aGUgY2xhc3NpYyBtNjhrIHN1cHBvcnQg
aW4gdGhlcmUsIHNvCkFja2VkLWJ5OiBHZWVydCBVeXR0ZXJob2V2ZW4gPGdlZXJ0QGxpbnV4LW02
OGsub3JnPgoKR3J7b2V0amUsZWV0aW5nfXMsCgrCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCBHZWVydAoKLS0KR2VlcnQgVXl0dGVyaG9ldmVuIC0tIFRoZXJlJ3MgbG90cyBvZiBM
aW51eCBiZXlvbmQgaWEzMiAtLSBnZWVydEBsaW51eC1tNjhrLm9yZwoKSW4gcGVyc29uYWwgY29u
dmVyc2F0aW9ucyB3aXRoIHRlY2huaWNhbCBwZW9wbGUsIEkgY2FsbCBteXNlbGYgYSBoYWNrZXIu
IEJ1dAp3aGVuIEknbSB0YWxraW5nIHRvIGpvdXJuYWxpc3RzIEkganVzdCBzYXkgInByb2dyYW1t
ZXIiIG9yIHNvbWV0aGluZyBsaWtlIHRoYXQuCsKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgwqAgwqDCoCAtLSBMaW51cyBUb3J2YWxkcwpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwp1Q2xpbnV4LWRldiBtYWlsaW5nIGxpc3QKdUNs
aW51eC1kZXZAdWNsaW51eC5vcmcKaHR0cDovL21haWxtYW4udWNsaW51eC5vcmcvbWFpbG1hbi9s
aXN0aW5mby91Y2xpbnV4LWRldgpUaGlzIG1lc3NhZ2Ugd2FzIHJlc2VudCBieSB1Y2xpbnV4LWRl
dkB1Y2xpbnV4Lm9yZwpUbyB1bnN1YnNjcmliZSBzZWU6Cmh0dHA6Ly9tYWlsbWFuLnVjbGludXgu
b3JnL21haWxtYW4vb3B0aW9ucy91Y2xpbnV4LWRldg==
